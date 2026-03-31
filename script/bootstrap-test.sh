#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE_NAME="dotfiles-bootstrap-test"
CONTAINER_NAME="dotfiles-test"

log() { printf '\n==> %s\n' "$*"; }

# Get a GitHub token for cloning the private repo
if command -v gh &>/dev/null; then
    GH_TOKEN="$(gh auth token 2>/dev/null || true)"
fi
if [[ -z "${GH_TOKEN:-}" ]]; then
    echo "ERROR: A GitHub token is required to clone the private repo."
    echo "  Authenticate with: gh auth login"
    exit 1
fi

cleanup_container() {
    if docker container inspect "$CONTAINER_NAME" >/dev/null 2>&1; then
        log "Removing existing container: $CONTAINER_NAME"
        docker rm -f "$CONTAINER_NAME"
    fi
}

# --- Build ---
log "Building test image"
docker build -t "$IMAGE_NAME" "$SCRIPT_DIR"

# --- Run ---
cleanup_container

log "Starting container: $CONTAINER_NAME"
docker run -d --name "$CONTAINER_NAME" "$IMAGE_NAME"

# --- Copy local bootstrap script into the container ---
log "Copying local script/bootstrap into container"
docker cp "$REPO_ROOT/script/bootstrap" "$CONTAINER_NAME:/tmp/bootstrap.sh"
docker exec -u root "$CONTAINER_NAME" chown testuser:testuser /tmp/bootstrap.sh
docker exec -u root "$CONTAINER_NAME" chmod +x /tmp/bootstrap.sh

# --- Configure git credentials for private repo ---
log "Configuring git credentials in container"
docker exec "$CONTAINER_NAME" bash -c "git config --global credential.helper store"
docker exec "$CONTAINER_NAME" bash -c "echo 'https://x-access-token:${GH_TOKEN}@github.com' > \$HOME/.git-credentials"

# --- Execute bootstrap (bare repo setup only) ---
log "Running bootstrap inside the container"
docker exec "$CONTAINER_NAME" /tmp/bootstrap.sh
BOOTSTRAP_EXIT=$?

if [[ $BOOTSTRAP_EXIT -ne 0 ]]; then
    echo "FAIL: bootstrap exited with code $BOOTSTRAP_EXIT"
    echo "Container $CONTAINER_NAME is still running for inspection."
    echo "  docker exec -it $CONTAINER_NAME bash"
    exit 1
fi

# --- Copy all local tracked files over the checked-out versions (test local changes) ---
log "Copying local dotfiles into container"
git -C "$REPO_ROOT" ls-files | while read -r f; do
    # Skip test infrastructure — not deployed to $HOME
    case "$f" in script/*|CLAUDE.md|README.md) continue ;; esac
    docker exec "$CONTAINER_NAME" mkdir -p "/home/testuser/$(dirname "$f")"
    docker cp "$REPO_ROOT/$f" "$CONTAINER_NAME:/home/testuser/$f"
done
docker exec -u root "$CONTAINER_NAME" bash -c \
    "chown -R testuser:testuser /home/testuser"

# --- Run bare update (dependency installation) ---
log "Running bare update inside the container"
docker exec "$CONTAINER_NAME" bash -c "source \$HOME/.functions && bare update"
BARE_UPDATE_EXIT=$?

if [[ $BARE_UPDATE_EXIT -ne 0 ]]; then
    echo "FAIL: bare update exited with code $BARE_UPDATE_EXIT"
    echo "Container $CONTAINER_NAME is still running for inspection."
    echo "  docker exec -it $CONTAINER_NAME bash"
    exit 1
fi

# --- Validation checks ---
log "Running validation checks"
FAILURES=0

check() {
    local description="$1"
    shift
    if docker exec "$CONTAINER_NAME" bash -c "$*" >/dev/null 2>&1; then
        echo "  PASS: $description"
    else
        echo "  FAIL: $description"
        FAILURES=$((FAILURES + 1))
    fi
}

check "bare repo exists at ~/.cfg" \
    'git --git-dir=$HOME/.cfg rev-parse --is-bare-repository'

check ".functions exists" \
    'test -f $HOME/.functions'

check "bare function is available" \
    'source $HOME/.functions && type bare'

check "Oh My Zsh installed" \
    'test -d $HOME/.oh-my-zsh'

check "asdf binary is on PATH" \
    'export PATH=/usr/local/bin:$PATH && asdf version'

check ".zshrc exists" \
    'test -f $HOME/.zshrc'

check ".zshrc contains config alias" \
    'grep -q "alias config=" $HOME/.zshrc'

check ".tool-versions exists" \
    'test -f $HOME/.tool-versions'

check "node is installed at expected version" \
    'export ASDF_DATA_DIR=$HOME/.asdf && export PATH=$ASDF_DATA_DIR/shims:$PATH && node --version | grep -q "v22.14.0"'

check "neovim is installed" \
    'export ASDF_DATA_DIR=$HOME/.asdf && export PATH=$ASDF_DATA_DIR/shims:$PATH && nvim --version | grep -q "NVIM"'

check "neovim config exists" \
    'test -f $HOME/.config/nvim/init.lua'

check "tmux is installed" \
    'export ASDF_DATA_DIR=$HOME/.asdf && export PATH=$ASDF_DATA_DIR/shims:$PATH && tmux -V'

check "fzf is installed" \
    'export ASDF_DATA_DIR=$HOME/.asdf && export PATH=$ASDF_DATA_DIR/shims:$PATH && fzf --version'

check "kubecolor is installed" \
    'export ASDF_DATA_DIR=$HOME/.asdf && export PATH=$ASDF_DATA_DIR/shims:$PATH && kubecolor --kubecolor-version'

check ".tmux.conf exists" \
    'test -f $HOME/.tmux.conf'

# --- Summary ---
echo ""
if [[ $FAILURES -eq 0 ]]; then
    log "All checks passed"
else
    log "$FAILURES check(s) failed"
fi

log "Container '$CONTAINER_NAME' is still running."
echo "  Inspect: docker exec -it $CONTAINER_NAME zsh"
echo "  Stop:    docker rm -f $CONTAINER_NAME"

exit $FAILURES

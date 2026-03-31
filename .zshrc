# --- XDG Base Directories ---
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# --- Environment Variables ---
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOBIN="$XDG_DATA_HOME/go/bin"
export GOPATH="$XDG_DATA_HOME/go"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export PIP_DISABLE_PIP_VERSION_CHECK=1
export PIP_REQUIRE_VIRTUALENV=1

# --- PATH ---
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$HOME/.krew/bin:$HOME/node_modules/.bin:$HOME/.local/bin:$XDG_DATA_HOME/cargo/bin:$XDG_DATA_HOME/go/bin:$XDG_DATA_HOME/npm/bin:$ASDF_DATA_DIR/shims:$PATH"

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(dotenv git kubectl tmux vi-mode)

# tmux plugin settings
export ZSH_TMUX_AUTOSTART="true"
export ZSH_TMUX_AUTOQUIT="false"

# completion
export COMPLETION_WAITING_DOTS="true"

source "$ZSH/oh-my-zsh.sh"

# --- Aliases ---

# Dotfiles bare repo alias
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Neovim aliases
alias v='nvim'
alias n='nvim --listen ./.nvim'

# --- Load bare dotfiles CLI and helper functions ---
[[ -f "$HOME/.functions" ]] && source "$HOME/.functions"

# --- Tool Integrations ---

# fzf
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

# kubecolor
if command -v kubecolor >/dev/null 2>&1; then
  alias kubectl='kubecolor'
fi

# Ghostty shell integration
if [ -n "$GHOSTTY_RESOURCES_DIR" ]; then
  builtin source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi

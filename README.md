# dotfiles

Personal dotfiles managed using the [bare git repository method](https://www.atlassian.com/git/tutorials/dotfiles). Tool and runtime versions are managed with [asdf](https://asdf-vm.com/).

## How it works

Dotfiles are tracked in a bare git repo at `$HOME/.cfg` with `$HOME` as the working tree. A shell alias keeps regular `git` commands separate:

```bash
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Use `config` in place of `git` to manage dotfiles:

```bash
config status
config add .vimrc
config commit -m "add vimrc"
config push
```

Untracked files are hidden by default (`status.showUntrackedFiles no`), so only explicitly added files are shown.

## Bootstrap a new machine

The bootstrap script sets up a fresh Ubuntu 24.04 machine from scratch:

```bash
DOTFILES_REPO_URL=git@github.com:juan-lee/dotfiles.git ./script/bootstrap
```

This is idempotent and will:

1. Install base packages (git, curl, zsh, etc.)
2. Clone the bare dotfiles repo to `~/.cfg` and check out files to `$HOME` (conflicting files are backed up to `~/.config-backup`)
3. Install [Oh My Zsh](https://ohmyz.sh/) without overwriting `~/.zshrc`
4. Install the [asdf](https://asdf-vm.com/) version manager binary
5. Run `asdf install` to install tool versions from `~/.tool-versions`
6. Set zsh as the login shell

### Optional environment variables

| Variable | Default | Description |
|---|---|---|
| `DOTFILES_REPO_URL` | `git@github.com:juan-lee/dotfiles.git` | Dotfiles repo URL |
| `ASDF_VERSION` | `0.18.1` | asdf release to install |
| `DOTFILES_GIT_DIR` | `$HOME/.cfg` | Bare repo location |
| `DOTFILES_BACKUP_DIR` | `$HOME/.config-backup` | Backup dir for conflicts |

## What's included

| File | Purpose |
|---|---|
| `.zshrc` | Zsh config with Oh My Zsh, asdf PATH setup, and `config` alias |
| `.gitconfig` | Git user identity |
| `.tool-versions` | asdf tool versions (currently Node.js 22.14.0) |
| `.asdfrc` | asdf settings (legacy version files, concurrency) |
| `script/bootstrap` | Machine provisioning script |

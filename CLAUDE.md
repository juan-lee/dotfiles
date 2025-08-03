# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository using a symlink-based approach for managing Unix configuration files. The setup supports both Linux and macOS environments with a focus on cloud-native development (Kubernetes, Azure, Go).

## Common Commands

### Installation
```bash
# Full installation (installs dependencies and creates symlinks)
./bootstrap

# Create symlinks only
make all

# Remove all symlinks
make clean
```

### Testing Changes
```bash
# Test in Docker environment
docker build -t dotfiles .
docker run -it dotfiles
```

## Architecture

### Directory Structure
- **Root level**: Individual dotfiles (zshrc, aliases, exports, functions, etc.)
- **config/nvim/**: Modern Neovim configuration using Lua
  - `init.lua`: Entry point
  - `lua/packages.lua`: Packer.nvim plugin management
  - `after/plugin/`: Plugin-specific configurations

### Key Components
1. **Shell**: Zsh with Oh My Zsh, custom theme (jpang.zsh-theme)
2. **Editor**: Neovim with LSP, DAP, Telescope, Treesitter
3. **Multiplexer**: tmux with TPM plugin manager
4. **Tools**: kubectl, Azure CLI, fzf, ripgrep integrated

### Installation Flow
1. `bootstrap` script detects OS (Linux/macOS)
2. Installs system dependencies via apt/brew
3. Sets up development tools (Go, kubectl, Azure CLI)
4. Installs Oh My Zsh
5. Runs `make all` to create symlinks

### Symlink Strategy
The Makefile creates symlinks from `$HOME` to files in this repository. It uses conditional symlink creation to avoid overwriting existing files.

## Development Notes

- The repository uses Neovim as the primary editor (vim aliases to nvim)
- Extensive Kubernetes utilities in `functions` file
- Theme consistency via tinted-theming across vim, tmux, and shell
- Git integration built into the zsh theme
- No automated tests; changes should be verified manually or in Docker
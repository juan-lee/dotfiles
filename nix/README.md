# Nix + Home Manager Dotfiles

This directory contains a Nix-based alternative to the traditional bootstrap script for managing dotfiles. It uses Nix for package management and Home Manager for configuration management.

## Prerequisites

1. Install Nix (with flake support):
   ```bash
   curl -L https://nixos.org/nix/install | sh -s -- --daemon
   ```

2. Enable flakes:
   ```bash
   mkdir -p ~/.config/nix
   echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
   ```

3. Install Home Manager:
   ```bash
   nix run home-manager/master -- init
   ```

## Installation

### Local Installation

For Linux:
```bash
cd nix/
home-manager switch --flake .#jpang
```

For macOS:
```bash
cd nix/
home-manager switch --flake .#jpang@darwin
```

Or use the Makefile:
```bash
make switch          # Linux
make switch-darwin   # macOS
```

### Testing with Docker

Build and test the configuration in a container:
```bash
make docker-build
make docker-run
```

## What's Included

This Nix configuration provides the exact same environment as the traditional bootstrap script:

### Packages
- **Development**: git, ripgrep, fzf, jq, tmux, zsh
- **Build tools**: gnumake, cmake, ninja, gcc, gettext, unzip
- **Languages**: Go 1.23
- **Cloud tools**: kubectl, kubectx, azure-cli

### Configurations
- **Zsh**: Oh My Zsh with jpang theme and plugins
- **Neovim**: Full configuration with Packer plugin manager
- **Tmux**: Configuration with TPM plugin manager
- **Dotfiles**: All original dotfiles (aliases, exports, functions, etc.)

### Directory Structure
```
nix/
├── flake.nix              # Main Nix flake
├── home.nix               # Home Manager configuration
├── modules/               # Modular configurations
│   ├── packages.nix       # Package definitions
│   ├── shell.nix          # Zsh and Oh My Zsh setup
│   ├── neovim.nix         # Neovim configuration
│   └── tmux.nix           # Tmux configuration
├── dotfiles/              # Configuration files
└── Dockerfile             # For testing
```

## Advantages of Nix Approach

1. **Reproducible**: Exact same packages across different machines
2. **Declarative**: Configuration as code
3. **Atomic updates**: Either all changes apply or none do
4. **Rollback**: Easy to rollback to previous configurations
5. **Cross-platform**: Same configuration works on Linux and macOS
6. **Isolated**: Doesn't interfere with system packages

## Updating

To update packages:
```bash
nix flake update
home-manager switch --flake .#jpang
```

## Notes

- This setup is completely independent of the original bootstrap approach
- Plugin managers (Packer for Neovim, TPM for Tmux) are automatically installed
- The configuration produces the same result as the traditional bootstrap script
- All dotfiles are copied to maintain independence from the original files
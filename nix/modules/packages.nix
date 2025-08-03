{ config, pkgs, lib, ... }:

{
  # Packages to install
  home.packages = with pkgs; [
    # Version control
    git

    # Terminal utilities
    tmux
    fzf
    ripgrep
    jq
    zsh

    # Build tools
    gnumake
    cmake
    ninja
    gcc
    gettext
    unzip

    # Language runtimes
    go_1_23

    # Kubernetes tools
    kubectl
    kubectx

    # Cloud tools
    azure-cli

    # Additional tools from bootstrap
    curl
    gnupg
    
    # For macOS compatibility
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    # Linux-specific packages
    language-pack-en
  ];

  # Special handling for Go installation path on Linux
  # Note: On Linux, we'll need to handle the /usr/local/go installation separately
  # as Nix manages Go differently than the bootstrap script
}
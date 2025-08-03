{ config, pkgs, lib, ... }:

{
  # Tmux is installed via packages.nix
  # This module handles configuration

  # Link tmux configuration
  home.file.".tmux.conf".source = ../dotfiles/tmux.conf;

  # Install TPM (Tmux Plugin Manager)
  home.activation.installTPM = lib.hm.dag.entryAfter ["writeBoundary"] ''
    TPM_DIR="$HOME/.tmux/plugins/tpm"
    if [ ! -d "$TPM_DIR" ]; then
      $DRY_RUN_CMD ${pkgs.git}/bin/git clone \
        https://github.com/tmux-plugins/tpm \
        "$TPM_DIR"
    fi
  '';
}
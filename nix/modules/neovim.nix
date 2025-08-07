{ config, pkgs, lib, ... }:

{
  # Neovim configuration
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    
    # Use the latest stable neovim package
    package = pkgs.neovim-unwrapped;

    # Additional packages needed by plugins
    extraPackages = with pkgs; [
      # Language servers and tools
      nodejs
      python3
      python3Packages.pynvim
      
      # For telescope and other plugins
      fd
      
      # For treesitter
      tree-sitter
      
      # For mason.nvim to work properly
      unzip
      wget
      gnutar
      gzip
    ];
  };

  # Link Neovim configuration
  home.file = {
    ".config/nvim".source = ../dotfiles/nvim;
    ".config/nvim".recursive = true;
    
    # Legacy vim config
    ".vimrc".source = ../dotfiles/vimrc;
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Install packer.nvim
  home.activation.installPacker = lib.hm.dag.entryAfter ["writeBoundary"] ''
    PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    if [ ! -d "$PACKER_DIR" ]; then
      $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 \
        https://github.com/wbthomason/packer.nvim \
        "$PACKER_DIR"
    fi
  '';
}
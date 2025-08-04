{ config, pkgs, lib, ... }:

{
  # Zsh configuration
  programs.zsh = {
    enable = true;
    
    # Oh My Zsh configuration
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "tmux"
        "vi-mode"
        "nmap"
        "colored-man-pages"
        "golang"
        "kubectl"
        "kubectx"
        "dotenv"
      ];
      theme = "jpang";
    };

    # Source our dotfiles
    initExtra = ''
      # Source dotfiles in specific order
      for file in ~/.includes ~/.aliases ~/.functions ~/.path ~/.extra ~/.exports; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
      done;

      # Tmux configuration for Oh My Zsh
      export ZSH_TMUX_AUTOSTART=true
      export ZSH_TMUX_AUTOQUIT=false
    '';
  };

  # Link dotfiles
  home.file = {
    ".aliases".source = ../dotfiles/aliases;
    ".exports".source = ../dotfiles/exports;
    ".functions".source = ../dotfiles/functions;
    ".includes".source = ../dotfiles/includes;
    ".path".source = ../dotfiles/path;
    # Note: .zshrc is managed by Oh My Zsh, not linked manually
    
    # Oh My Zsh custom theme
    ".oh-my-zsh/custom/themes/jpang.zsh-theme".source = ../dotfiles/jpang.zsh-theme;
  };

  # FZF configuration
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Default shell
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };
}
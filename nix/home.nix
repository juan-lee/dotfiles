{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jpang";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/jpang" else "/home/jpang";

  # This value determines the Home Manager release that your
  # configuration is compatible with.
  home.stateVersion = "24.05";

  # Import all modules
  imports = [
    ./modules/packages.nix
    ./modules/shell.nix
    ./modules/neovim.nix
    ./modules/tmux.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Create necessary directories
  home.file.".kube/.keep".text = "";
  home.file."Code/.keep".text = "";
  home.file."bin/.keep".text = "";
  home.file.".config/.keep".text = "";

  # Set up Go environment
  home.sessionVariables = {
    GOPATH = "$HOME/go";
    GOROOT = if pkgs.stdenv.isDarwin then "" else "/usr/local/go";
  };

  # Additional PATH entries will be handled in shell.nix
}
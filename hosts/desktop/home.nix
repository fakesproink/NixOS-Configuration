{ config, pkgs, inputs, ... }:

{
  home.username = "sproink";
  home.homeDirectory = "/home/sproink";

  imports = [
    ./../../homeManagerModules
  ];

  #home.packages = with pkgs; [
  #  unzip
  #  nwg-look
  #  xfce.thunar
  #  cava
  #  jetbrains-mono
  #  git
  #  hyprpaper
  #  discord
  #  betterdiscordctl
  #  hyprshot
  #  hyprpolkitagent
  #  swaynotificationcenter
  #  feh
  #  neovim
  #  vimPlugins.LazyVim
  #  zed-editor
  #];

  discord.enable = true;
  betterdiscord.enable = true;
  firefox.enable = true;
  zeditor.enable = true;
  waybar.enable = true;
  hyprshot.enable = true;
  hyprland.enable = true;
  swaync.enable = true;
  dolphin.enable = true;

  kitty.enable = true;
  unzip.enable = true;
  neovim.enable = true;
  git.enable = true;
  fastfetch.enable = true;
  cava.enable = true;
  wofi.enable = true;

  zsh.enable = true;
  customfonts.enable = true;

  #gtk = {
  #  enable = true;

  #  theme = {
  #    package = pkgs.nordic;
  #    name = "Nordic";
  #  };
  #};

  xdg.userDirs = {
    enable = true;
    documents = "$HOME/documents";
    download = "$HOME/downloads";
    pictures = "$HOME/pictures";
    music = "$HOME/whatever";
    videos = "$HOME/whatever";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}

{ ... }:
# im bored
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
  firefox.enable = true;
  zeditor.enable = true;
  waybar.enable = true;
  hyprshot.enable = true;
  hyprland.enable = true;
  hyprlock.enable = true;
  swaync.enable = true;
  /* dolphin.enable = true; */
  wlogout.enable = true;
  thunar.enable = true;
  qemu.enable = true;
  obsidian.enable = true;
  anki.enable = true;
  
  ghostty.enable = true;
  btop.enable = true;
  unzip.enable = true;
  neovim.enable = true;
  git.enable = true;
  gh.enable = true;
  fastfetch.enable = true;
  cava.enable = true;
  wofi.enable = true;
  udiskie.enable = true;

  fish.enable = true;
  starship.enable = true;
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
    desktop = "$HOME/desktop";
    documents = "$HOME/documents";
    download = "$HOME/downloads";
    pictures = "$HOME/pictures";
    music = "$HOME/music";
    videos = "$HOME/videos";
    publicShare = "$HOME/public";
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

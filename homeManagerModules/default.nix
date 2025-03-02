{ inputs, pkgs, config, ... }: {
  imports = [
    # general/gui apps
    ./discord/discord.nix
    ./betterdiscord/betterdiscord.nix
    ./firefox/firefox.nix
    ./thunar/thunar.nix
    ./zeditor/zeditor.nix
    ./waybar/waybar.nix
    ./nwg/nwg.nix
    ./hyprland/hyprland.nix
    ./hyprshot/hyprshot.nix
    ./hyprpaper/hyprpaper.nix
    ./wofi/wofi.nix

    # terminal
    ./kitty/kitty.nix
    ./unzip/unzip.nix
    ./neovim/neovim.nix
    ./git/git.nix
    ./fastfetch/fastfetch.nix
    ./cava/cava.nix

    # system/misc
    ./zsh/zsh.nix
    ./customfonts/customfonts.nix
  ];
}

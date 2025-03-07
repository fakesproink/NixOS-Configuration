{ inputs, pkgs, config, ... }: {
  imports = [
    # general/gui apps
    ./discord/discord.nix
    ./betterdiscord/betterdiscord.nix
    ./firefox/firefox.nix
    ./zeditor/zeditor.nix
    ./waybar/waybar.nix
    ./hyprland/hyprland.nix
    ./hyprshot/hyprshot.nix
    ./wofi/wofi.nix
    ./swaync/swaync.nix

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

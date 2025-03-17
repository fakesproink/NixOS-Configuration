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
    ./dolphin/dolphin.nix
    ./thunar/thunar.nix
    ./swaync/swaync.nix
    ./qemu/qemu.nix

    # terminal
    ./kitty/kitty.nix
    ./unzip/unzip.nix
    ./udiskie/udiskie.nix
    ./neovim/neovim.nix
    ./git/git.nix
    ./gh/gh.nix
    ./fastfetch/fastfetch.nix
    ./cava/cava.nix

    # system/misc
    ./zsh/zsh.nix
    ./customfonts/customfonts.nix
  ];
}

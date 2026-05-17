# stylix.nix

{ pkgs, config, ... }: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    image = ./../homeManagerModules/hyprland/wallpaper/IMG_5875.png;
    polarity = "dark";
    autoEnable = true;
    targets.grub.enable = false;

    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Nord)";
      size = 24;
    };

    opacity = {
      applications = 0.85;
      terminal = 0.85;
      popups = 1.0;
      desktop = 1.0;
    };

    fonts = {
      sizes = {
        applications = 11;
        terminal = 9.25;
        popups = 12;
        desktop = 11;
      };

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };
  };
}

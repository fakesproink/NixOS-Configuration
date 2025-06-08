# stylix.nix

{ pkgs, config, ... }: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    image = ./../homeManagerModules/hyprland/wallpaper/nord-wallpapers-v0-mpyy5m6t1t9a1.png;
    polarity = "dark";
    autoEnable = true;

    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Nord)";
      size = 24;
    };

    opacity = {
      applications = 1.0;
      terminal = 1.0;
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

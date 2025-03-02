{ lib, config, ... }: {
  options = {
    hyprpaper.ennable =
      lib.mkEnableOption "hyprpaper";
  };

  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "./wallpaper/nordic_mountains.png" ];
        wallpaper = [
          "eDP-1, ./wallpaper/nordic_mountains.png"
          "HDMI-A-1, ./wallpaper/nordic_mountains.png"
        ];
      };
    };
  };
}

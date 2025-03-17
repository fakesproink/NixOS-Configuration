{ lib, config, ... }: {
  options = {
    udiskie.enable = lib.mkEnableOption "udiskie";
  };

  config = lib.mkIf config.udiskie.enable {
    services.udiskie = {
      enable = true;
      tray = "always";
    };
  };
}

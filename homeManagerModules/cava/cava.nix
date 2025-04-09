{ lib, config, ... }: {
  options = {
    cava.enable =
      lib.mkEnableOption "cava";
  };

  config = lib.mkIf config.cava.enable {
    programs.cava = {
      enable = true;
      settings = {
        general.framerate = 60;
        color.foreground = "'#88c0d0'";
      };
    };
  };
}

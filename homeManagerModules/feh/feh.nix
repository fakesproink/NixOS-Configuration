{ pkgs, lib, config, ... }: {
  options = {
    feh.enable = lib.mkEnableOption "feh";
  };

  config = lib.mkIf config.feh.enable {
    programs.feh = {
      enable = true;

      keybindings = {
        zoom_in = "plus";
        zoom_out = "minus";
      };
    };
  };
}

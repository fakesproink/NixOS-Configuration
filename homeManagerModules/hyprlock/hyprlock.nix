{ pkgs, lib, config, ... }: {
  options = {
    hyprlock.enable = lib.mkEnableOption "hyprlock";
  };

  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;

      settings = {
        general = {
          disable_loading_bar = true;
          grace = 0;
          hide_cursor = false;
          no_fade_in = false;
          no_fade_out = false;
          ignore_empty_input = false;
        }; 
      };
    };
  };
}

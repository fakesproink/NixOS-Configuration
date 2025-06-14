{ lib, config, ... }: {
  options = {
    wlogout.enable =
      lib.mkEnableOption "wlogout";
  };

  config = lib.mkIf config.wlogout.enable {
    programs.wlogout = {
      enable = true; 
    };
  };
}

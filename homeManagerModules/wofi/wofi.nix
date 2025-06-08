{ lib, config, ... }: {
  options = {
    wofi.enable =
      lib.mkEnableOption "wofi";
  };

  config = lib.mkIf config.wofi.enable {
    programs.wofi = {
      enable = true;

      settings = { 
        width = "30%";
      };

      style = ''
        #text { margin-left: 5px; margin-right: 5px; }
      '';
    };
  };
}

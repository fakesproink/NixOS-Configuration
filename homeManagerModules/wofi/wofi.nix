{ lib, config, ... }: {
  options = {
    wofi.enable =
      lib.mkEnableOption "wofi";
  };

  config = lib.mkIf config.wofi.enable {
    programs.wofi = {
      enable = true;
      style = lib.mkDefault ''
        ${./style.css}
      '';
    };
  };
}

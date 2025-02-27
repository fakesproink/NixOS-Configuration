{ pkgs, lib, config, inputs, ... }: {
  options = {
    wofi.enable =
      lib.mkEnableOption "wofi";
  };

  config = lib.mkIf config.wofi.enable {
    programs.wofi = {
      enable = true;
      package = pkgs.wofi;
      style = ./style.css;
    };
  };
}

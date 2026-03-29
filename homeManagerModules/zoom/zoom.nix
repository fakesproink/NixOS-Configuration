{ pkgs, lib, config, ... }: {
  options = {
    zoom.enable = lib.mkEnableOption "zoom";
  };

  config = lib.mkIf config.zoom.enable {
    home.packages = with pkgs; [
      zoom-us
    ];
  };
}

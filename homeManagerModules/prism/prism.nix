{ pkgs, lib, config, ... }: {
  options = {
    prism.enable = lib.mkEnableOption "prism";
  };

  config = lib.mkIf config.zoom.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}

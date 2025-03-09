{ pkgs, lib, config, ... }: {
  options = {
    dolphin.enable = lib.mkEnableOption "dolphin";
  };

  config = lib.mkIf config.dolphin.enable {
    home.packages = with pkgs; [
      kdePackages.dolphin
      kdePackages.qtsvg
      kdePackages.qtwayland
    ];
  };
}

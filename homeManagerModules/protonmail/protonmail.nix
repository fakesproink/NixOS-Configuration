{ pkgs, lib, config, ...}: {
  options = {
    protonmail.enable = lib.mkEnableOption "protonmail";
  };

  config = lib.mkIf config.protonmail.enable {
    home.packages = with pkgs; [
      protonmail-desktop
    ];
  };
}

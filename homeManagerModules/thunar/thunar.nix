{ pkgs, lib, config, inputs, ... }: {
  options = {
    thunar.enable =
      lib.mkEnableOption "thunar";
  };

  config = lib.mkIf config.thunar.enable {
    home.packages = with pkgs; [
      xfce.thunar
    ];
  };
}

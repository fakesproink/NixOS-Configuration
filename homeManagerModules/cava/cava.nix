{ pkgs, lib, config, ... }: {
  options = {
    cava.enable =
      lib.mkEnableOption "cava";
  };

  config = lib.mkIf config.cava.enable {
    home.packages = with pkgs; [
      cava
    ];
  };
}

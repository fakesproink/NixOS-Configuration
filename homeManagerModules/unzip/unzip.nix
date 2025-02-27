{ pkgs, lib, config, inputs, ... }: {
  options = {
    unzip.enable =
      lib.mkEnableOption "unzip";
  };

  config = lib.mkIf config.unzip.enable {
    home.packages = with pkgs; [
      unzip
    ];
  };
}

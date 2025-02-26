{ pkgs, lib, config, ... }: {
  options = {
    nwg.enable =
      lib.mkEnableOption "nwg";
  };

  config = lib.mkIf config.nwg.enable {
    home.packages = with pkgs; [
      nwg-look
    ];
  };
}

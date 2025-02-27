{ pkgs, lib, config, inputs, ... }: {
  options = {
    betterdiscord.enable =
      lib.mkEnableOption "betterdiscord";
  };

  config = lib.mkIf config.betterdiscord.enable {
    home.packages = with pkgs; [
      betterdiscordctl
    ];
  };
}

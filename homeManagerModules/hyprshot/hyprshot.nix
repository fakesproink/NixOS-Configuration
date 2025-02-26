{ pkgs, lib, config, ... }: {
  options = {
    hyprshot.enable =
      lib.mkEnableOption "hyprshot";
  };

  config = lib.mkIf config.hyprshot.enable {
    home.packages = with pkgs; [
      hyprshot
    ];
  };
}

{ pkgs, lib, config, ... }: {
  options = {
    customfonts.enable =
      lib.mkEnableOption "customfonts";
  };

  config = lib.mkIf config.customfonts.enable {
    home.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig.enable = true;
  };
}

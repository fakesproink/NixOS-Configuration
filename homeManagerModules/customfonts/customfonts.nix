{ pkgs, lib, config, ... }: {
  options = {
    customfonts.enable =
      lib.mkEnableOption "customfonts";
  };

  config = lib.mkIf config.customfonts.enable {
    home.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      noto-fonts-cjk-sans
    ];

    fonts.fontconfig.enable = true;
  };
}

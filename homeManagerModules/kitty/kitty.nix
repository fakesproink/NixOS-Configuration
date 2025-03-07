{ lib, config, ... }: {
  options = {
    kitty.enable =
      lib.mkEnableOption "kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      themeFile = "Nord";
    };
  };
}

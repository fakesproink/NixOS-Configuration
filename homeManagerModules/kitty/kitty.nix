{ pkgs, lib, config, ... }: {
  options = {
    kitty.enable =
      lib.mkEnableOption "kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      font = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
        size = 9;
      };
      themeFile = "Nord";
    };
  };
}

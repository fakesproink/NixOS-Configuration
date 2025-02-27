{ pkgs, lib, config, inputs, ... }: {
  options = {
    kitty.enable =
      lib.mkEnableOption "kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
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

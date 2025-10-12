{ lib, config, ... }: {
  options = {
    ghostty.enable = lib.mkEnableOption "ghostty";
  };

  config = lib.mkIf config.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        custom-shader = "${./shaders/cursor_smear.glsl}";
        custom-shader-animation = "always";
      };
    };
  };
}

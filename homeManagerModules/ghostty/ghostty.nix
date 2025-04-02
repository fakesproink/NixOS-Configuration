{ lib, config, ... }: {
  options = {
    ghostty.enable = lib.mkEnableOption "ghostty";
  };

  config = lib.mkIf config.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}

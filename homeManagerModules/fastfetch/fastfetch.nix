{ lib, config, ... }: {
  options = {
    fastfetch.enable =
      lib.mkEnableOption "fastfetch";
  };

  config = lib.mkIf config.fastfetch.enable {
    programs.fastfetch.enable = true;
    home.file.".config/fastfetch/config.jsonc".source = ./config.jsonc;
  };
}

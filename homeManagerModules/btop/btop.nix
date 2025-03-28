{ lib, config, ... }: {
  options = {
    btop.enable = lib.mkEnableOption "btop";
  };

  config = lib.mkIf config.btop.enable {
    programs.btop = {
      enable = true;
    };
  };
}

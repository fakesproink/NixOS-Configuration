{ pkgs, lib, config, ... }: {
  options = {
    clock-rs.enable = lib.mkEnableOption "clock-rs";
  };

  config = lib.mkIf config.clock-rs.enable {
    programs.clock-rs = {
      enable = true;

      settings = {
        general = {
          color = "#81a1c1";
        };

        date = {
          fmt = "%A, %B %d, %Y";
          use_12h = false;
        };
      };
    };
  };
}

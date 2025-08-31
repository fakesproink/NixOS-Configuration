{ pkgs, lib, config, ... }: {
  options = {
    obs.enable = lib.mkEnableOption "obs";
  };

  config = lib.mkIf config.obs.enable {
    programs.obs-studio = {
      enable = true;
    };
  };
}

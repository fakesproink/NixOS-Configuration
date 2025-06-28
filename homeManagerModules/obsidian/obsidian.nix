{ inputs, lib, config, ... }: {
  options = {
    obsidian.enable = lib.mkEnableOption "obsidian";
  };

  config = lib.mkIf config.obsidian.enable {
    programs.obsidian = {
      enable = true;
    };
  };
}

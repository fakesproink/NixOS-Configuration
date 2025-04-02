{ lib, config, ... }: {
  options = {
    fish.enable = lib.mkEnableOption "fish";
  };

  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting
      '';
    };
  };
}

{ lib, config, ... }: {
  options = {
    starship.enable = lib.mkEnableOption "starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableInteractive = true;

      settings = {
        format = lib.concatStrings [
          "[](base09)"
          "$os"
          "$username"
        ];
        scan_timeout = 10;

        character = {
          disabled = false;
          success_symbol = "[](bold fg:base0B)";
          error_symbol = "[](bold fg:base08)";
        };
      };
    };
  };
}

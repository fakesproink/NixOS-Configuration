{ lib, config, pkgs, ... }: {
  options = {
    anki.enable = lib.mkEnableOption "anki";
  };

  config = lib.mkIf config.anki.enable {
    # home.packages = with pkgs; [
    #   anki-bin
    # ];

    programs.anki = {
      enable = true;
    };
  };
}

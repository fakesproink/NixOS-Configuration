{ pkgs, lib, config, ... }: {
  options = {
    git.enable =
      lib.mkEnableOption "git";
  };

  config = lib.mkIf config.git.enable {
    home.packages = with pkgs; [
      pass
      pinentry 
      git-credential-manager
      cargo
      p7zip
      steam-run
      libreoffice-qt6
      dosbox-x
    ];

    programs.git = {
      enable = true;
      userName = "fakesproink";
      userEmail = "bsushi308@gmail.com";

      # signing = {
      #   key = "A8058885A3A0E4D3";
      #   signByDefault = true;
      # };
    }; 

    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };
}

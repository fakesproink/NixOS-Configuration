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
      pipes
      p7zip
      steam-run
      wget
      libreoffice-qt6
      dosbox-x
      quickemu
      unityhub
      libcs50
    ];

    programs.git = {
      enable = true;
      userName = "fakesproink";
      userEmail = "bsushi308@gmail.com";

      # signing = {
      #   key = "A8058885A3A0E4D3";
      #   signByDefault = true;
      # };

      extraConfig = {
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
      # here's something to commit
    }; 

    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };
}

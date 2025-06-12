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
    ];

    programs.git = {
      enable = true;
      userName = "sproinker";
      userEmail = "bsushi308@gmail.com";

      signing = {
        key = "EBD65F1874C42DFB";
        signByDefault = true;
      };
      #extraConfig = {
      #  credential.helper = "manager";
      #  credential."https://github.com".username = "fakesproink";
      #  credential.credentialStore = "cache";
      #};
    };

    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
    };
  };
}

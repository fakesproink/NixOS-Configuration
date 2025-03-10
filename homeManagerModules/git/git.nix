{ pkgs, lib, config, inputs, ... }: {
  options = {
    git.enable =
      lib.mkEnableOption "git";
  };

  config = lib.mkIf config.git.enable {
    home.packages = with pkgs; [
      git-credential-manager
    ];
    programs.git = {
      enable = true;
      userName = "sproinker";
      userEmail = "bsushi308@gmail.com";
      extraConfig = {
        credential.helper = "manager";
        credential."https://github.com".username = "fakesproink";
        credential.credentialStore = "cache";
      };
    };
  };
}

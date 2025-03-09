{ pkgs, lib, config, inputs, ... }: {
  options = {
    git.enable =
      lib.mkEnableOption "git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "sproinker";
      userEmail = "bsushi308@gmail.com";
      git-credential-oauth.enable = true;
    };
  };
}

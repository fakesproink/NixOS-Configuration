{ pkgs, lib, config, inputs, ... }: {
  options = {
    gh.enable =
      lib.mkEnableOption "gh";
  };

  config = lib.mkIf config.gh.enable {
    programs.gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
        hosts = [ "https://github.com" ];
      };
    };
  };
}

{ pkgs, lib, config, inputs, ... }: {
  options = {
    firefox.enable =
      lib.mkEnableOption "firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      languagePacks = [ "en-US" ];

      profiles.sproink = {
        extensions = with inputs.nur.legacyPackages.${pkgs.stdenv.hostPlatform.system}.repos.rycee.firefox-addons; [
          ublock-origin
          darkreader
          sponsorblock
          theme-nord-polar-night
          mtab
          docsafterdark
        ];
      };
    };
  };
}

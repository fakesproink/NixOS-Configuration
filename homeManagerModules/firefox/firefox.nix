{ pkgs, lib, config, inputs, ... }: {
  options = {
    firefox.enable =
      lib.mkEnableOption "firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      languagePacks = [ "en-US" ];

      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          extensions = {
            packages = with inputs.firefox-addons.packages."x86_64-linux"; [
              ublock-origin
              sponsorblock
              darkreader
              docsafterdark
              theme-nord-polar-night
              mtab
            ];
          };

          settings = {
            "browser.startup.homepage" = "https://google.com";
          };
        };
      };
    };
  };
}

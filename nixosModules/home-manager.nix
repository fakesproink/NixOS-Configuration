# home-manager.nix

{ inputs, pkgs, ... }: {
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [
      inputs.self.outputs.homeManagerModules.default
      {
        stylix = {
          iconTheme = {
            enable = true;
            package = pkgs.zafiro-icons;
            dark = "Zafiro-icons-Dark";
            light = "Zafiro-icons-Light";
          };

          targets = {
            waybar = {
              enable = false;
            };

            nixvim = {
              enable = false;
            };

            wofi = {
              enable = true;
            };

            zed = {
              enable = false;
            };

            qt = {
              enable = true;
            };
          };
        };
      }
    ];
    users.sproink = ./../hosts/desktop/home.nix;
    backupFileExtension = "hm-backup";
  };
}

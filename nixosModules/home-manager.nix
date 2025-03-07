# home-manager.nix

{ inputs, ... }: {
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [
      inputs.self.outputs.homeManagerModules.default
      {
        stylix = {
          targets = {
            waybar = {
              enable = false;
              addCss = true;
            };

            wofi = {
              enable = true;
            };

            gtk = {
              enable = true;
            };

            zed = {
              enable = false;
            };
          };
        };
      }
    ];
    users.sproink = ./../hosts/desktop/home.nix;
    backupFileExtension = "hm-backup";
  };
}

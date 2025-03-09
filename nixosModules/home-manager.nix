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

# flake.nix
{
  description = "nix flake (hopefully i dont lose my sanity configuring all this)";

  # system inputs
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
  };

  outputs = { nixpkgs, nur, hyprland, home-manager, ... }@inputs: {
    nixosConfigurations = {
      sproink-nix = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nur.modules.nixos.default
          inputs.home-manager.nixosModules.home-manager
          ./hosts/desktop/configuration.nix
          ./nixosModules
        ];
      };
    };

    homeConfigurations."sproink@sproink-nix" = home-manager.lib.homeManagerConfiguration rec {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./homeManagerModules/hyprland/hyprland.nix
        {
          wayland.windowManager.hyprland = {
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
          };
        }
      ];
    };

    homeManagerModules.default = ./homeManagerModules;
  };
}

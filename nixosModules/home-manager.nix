{ inputs, ... }: {
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [inputs.self.outputs.homeManagerModules.default];
    users.sproink = ./../hosts/desktop/home.nix;
  };
}

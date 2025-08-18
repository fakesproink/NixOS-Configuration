{ pkgs, lib, config, inputs, ... }: {
  imports = with pkgs; [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  options = {
    spotify.enable = lib.mkEnableOption "spotify";
  };

  config = lib.mkIf config.spotify.enable {
    programs.spotify-player = {
      enable = true;
    };

    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
      in
      {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
          adblock
          shuffle
          hidePodcasts
        ];

        /* theme = spicePkgs.themes.nordic; */
      };
  };
}

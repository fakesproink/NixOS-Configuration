{ pkgs, lib, config, inputs, ... }: {
  options = {
    neovim.enable =
      lib.mkEnableOption "neovim";
  };

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;
      defaultEditor = true;
    };
  };
}

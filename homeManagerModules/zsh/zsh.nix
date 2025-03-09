{ pkgs, lib, config, inputs, ... }: {
  options = {
    zsh.enable =
      lib.mkEnableOption "zsh";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";

      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
      };
    };
  };
}

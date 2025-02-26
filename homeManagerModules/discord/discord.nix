{ pkgs, lib, config, ... }: {
  options = {
    discord.enable =
      lib.mkEnableOption "discord";
  };

  config = lib.mkIf config.discord.enable {
    home.packages = with pkgs; [
      discord
    ];

    home.file.".config/discord/settings.json".source = ./settings.json;
    home.file.".config/discord/quotes.json".source = ./quotes.json;
  };
}

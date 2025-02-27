{ pkgs, lib, config, inputs, ... }: {
  options = {
    zeditor.enable =
      lib.mkEnableOption "zeditor";
  };

  config = lib.mkIf config.zeditor.enable {
    programs.zed-editor = {
      enable = true;
      package = pkgs.zed-editor;
      extensions = [ "nix" "lua" "nord"];
      extraPackages = [ pkgs.nixd ];

      userSettings = {
        theme = {
          mode = "system";
          light = "Nord";
          dark = "Nord";
        };

        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        vim_mode = true;
        ui_font_size = 16;
        buffer_font_size = 14;
        soft_wrap = "editor_width";

        buffer_font_family = "JetBrains Mono";
        ui_font_family = "JetBrains Mono";
        ui_font_fallbacks = [".SystemUIFont"];
      };
    };
  };
}

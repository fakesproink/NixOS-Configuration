{ pkgs, lib, config, ... }: {
  options = {
    waybar.enable =
      lib.mkEnableOption "waybar";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      settings = [
        {
          layer = "top";
          position = "top";
          fixed-center = true;

          spacing = 0;
          height = 0;
          margin-top = 8;
          margin-right = 8;
          margin-bottom = 0;
          margin-left = 8;

          modules-left = [
            "hyprland/workspaces"
          ];

          modules-center = [
            "clock"
          ];

          modules-right = [
            "hyprland/language"
            "cpu_text"
            "cpu"
            "memory"
            "battery"
            "pulseaudio"
            "tray"
            "custom/notification"
          ];

          "hyprland/language" = {
            format = "{}";
            format-en = "EN";
          };

          "custom/notification" = {
            tooltip = false;
            format = "{icon}";
            format-icons = {
              notification = "";
              none = "";
              dnd-notification = "";
              dnd-none = "";
              inhibited-notification = "";
              inhibited-none = "";
              dnd-inhibited-notification = "";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            on-click = "swaync-client -t -sw";
            on-click-right = "swaync-client -d -sw";
            escape = true;
          };

          tray = {
            spacing = 10;
            tooltip = false;
          };

          clock = {
            format = "{:%H:%M - %a, %b %d %Y}";
            tooltip = true;
          };

          cpu = {
            format = "cpu {usage}%";
            interval = 2;

            states = {
              critical = 90;
            };
          };

          memory = {
            format = "mem {percentage}%";
            interval = 2;

            states = {
              critical = 80;
            };

            tooltip = true;
          };

          battery = {
            format = "battery {capacity}%";
            interval = 5;

            states = {
              warning = 20;
              critical = 10;
            };

            tooltip = false;
          };

          pulseaudio = {
            scroll-step = 5;
            max-volume = 100;
            format = "vol {volume}%";
            format-bluetooth = "vol {volume}%";
            nospacing = 1;
            on-click = "pavucontrol";
            tooltip = true;
          };

          "hyprland/workspaces" = {
            persistent-workspaces = {
              "*" = 6;
            };
          };
        }
      ];

      style = lib.mkDefault ./style.css;
    };
  };
}

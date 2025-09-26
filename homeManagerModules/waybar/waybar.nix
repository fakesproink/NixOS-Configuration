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
            "tray"
            "pulseaudio"
            "cpu_text"
            "cpu"
            "memory"
            "battery"
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
              notification = "󱅫";
              none = "󰂚";
              dnd-notification = "󰵙";
              dnd-none = "󰂛";
              inhibited-notification = "󱅫";
              inhibited-none = "󰂚";
              dnd-inhibited-notification = "󰵙";
              dnd-inhibited-none = "󰂛";
            };
            return-type = "json";
            exec = "swaync-client -swb";
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
            format = "󰻠 : {usage}%";
            interval = 2;

            states = {
              critical = 90;
            };
          };

          memory = {
            format = " : {percentage}%";
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
            format = "{icon} : {volume}%";
            format-muted = "󰖁 : {volume}%";
            format-icons = {
              default = [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
            };
          };

          "hyprland/workspaces" = {
            persistent-workspaces = {
              "*" = 12;
              HDMI-A-1 = [ 1 2 3 4 5 6 7 8 9 10 11 12 ];
              HDMI-A-2 = [ 1 2 3 4 5 6 7 8 9 10 11 12 ];
            };
          };
        }
      ];

      style = lib.mkDefault ./style.css;
    };
  };
}

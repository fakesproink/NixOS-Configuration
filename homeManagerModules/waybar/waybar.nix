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
            "tray"
            "cpu_text"
            "cpu"
            "memory"
            "battery"
            "network"
            "pulseaudio"
          ];

          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            tooltip = false;
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

          network = {
            format-wifi = "wifi {bandwithDownBits}";
            format-ethernet = "enth {bandwithDownBits}";
            format-disconnected = "no network";
            interval = 5;
            tooltip = true;
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

      style = ./style.css;
    };
  };
}

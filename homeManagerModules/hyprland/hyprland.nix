# i'll give you something to commit here

{ pkgs, lib, config, ... }: {
  options = {
    hyprland.enable =
      lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    home.packages = with pkgs; [
      wofi-emoji
      wl-clipboard
      pavucontrol
      lxqt.lxqt-policykit
    ];

    services.hyprpaper.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      systemd = {
        enable = true;
      };

      xwayland = {
        enable = true;
      };

      settings = {
        "$terminal" = "ghostty";
        "$fileManager" = "thunar";
        "$menu" = "wofi --show drun";
        "$browser" = "firefox";

        exec-once = [
          "waybar"
          "hyprpaper"
          "swaync"
          "lxqt-policykit-agent"
          "udiskie"
          "openrgb --device \"Razer Huntsman V2\" --color 88c0d0 --mode static --brightness 100"
          "openrgb --device \"Razer Deathadder Essential V2\" --color 00ff00 --mode static --brightness 100"
        ];

        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          #"col.active_border" = "rgb(8fbcbb)";
          #"col.inactive_border" = "rgb(3b4252)";
          resize_on_border = true;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 10;
          active_opacity = 1.0;
          inactive_opacity = 1.0;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            #color = "rgba(1a1a1aee)";
          };

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = true;
          bezier = [
            "easeOutQuint, 0.23, 1, 0.32, 1"
            "easeInOutCubic, 0.65, 0.05, 0.36, 1"
            "linear, 0, 0, 1, 1"
            "almostLinear, 0.5, 0.5, 0.75, 1.0"
            "quick, 0.15, 0, 0.1, 1"
          ];

          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_status = "master";
        };

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        gestures = {
          workspace_swipe = false;
        };

        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, Q, exec, $terminal"
          "$mainMod, C, killactive"
          "$mainMod, M, exit"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating,"
          "$mainMod, R, exec, $menu"
          "$mainMod, P, pseudo,"
          "$mainMod, J, togglesplit,"
          "$mainMod, B, exec, $browser"
          "$mainMod, PRINT, exec, hyprshot -m region"
          "$mainMod SHIFT, N, exec, swaync-client -t -sw"
          "$mainMod SHIFT, H, movewindow, l"
          "$mainMod SHIFT, L, movewindow, r"
          "$mainMod SHIFT, K, movewindow, u"
          "$mainMod SHIFT, J, movewindow, d"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          "$mainMod, -, workspace, 11"
          "$mainMod, =, workspace, 12"
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
          "$mainMod SHIFT, -, movetoworkspace, 11"
          "$mainMod SHIFT, =, movetoworkspace, 12"
          "$mainMod ALT, 1, focusworkspaceoncurrentmonitor, 1"
          "$mainMod ALT, 2, focusworkspaceoncurrentmonitor, 2"
          "$mainMod ALT, 3, focusworkspaceoncurrentmonitor, 3"
          "$mainMod ALT, 4, focusworkspaceoncurrentmonitor, 4"
          "$mainMod ALT, 5, focusworkspaceoncurrentmonitor, 5"
          "$mainMod ALT, 6, focusworkspaceoncurrentmonitor, 6"
          "$mainMod ALT, 7, focusworkspaceoncurrentmonitor, 7"
          "$mainMod ALT, 8, focusworkspaceoncurrentmonitor, 8"
          "$mainMod ALT, 9, focusworkspaceoncurrentmonitor, 9"
          "$mainMod ALT, 0, focusworkspaceoncurrentmonitor, 0"
          "$mainMod ALT, -, focusworkspaceoncurrentmonitor, 11"
          "$mainMod ALT, =, focusworkspaceoncurrentmonitor, 12"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        input = {
          kb_layout = "us";
          follow_mouse = 1;

          sensitivity = 0.0;

          touchpad = {
            natural_scroll = true;
          };
        };

        env = [
          "HYPRSHOT_DIR, pictures/screenshots"
          "XCURSOR,Capitaine Cursors (Nord)"
          "NIXOS_OZONE_WL, 1"
          "QT_QPA_PLATFORMTHEME,qt6ct"
        ];
      };

      extraConfig = ''
        monitor=eDP-1, 1920x1080@60, 0x-220, 1
        monitor=HDMI-A-1, 1440x900@60, 1920x0, 1
      '';
     };
  };
}

{ lib, config,  ... }: {
  options = {
    swaync.enable =
      lib.mkEnableOption "swaync";
  };

  config = lib.mkIf config.swaync.enable {
    services.swaync = {
      enable = true;
      settings = {
        positionX = "right";
        control-center-positionX = "none";
        control-center-positionY = "none";
        control-center-margin-top = 8;
        control-center-margin-bottom = 8;
        controlcenter-margin-left = 8;
        control-center-width = 500;
        control-center-height = 600;
        fit-to-screen = true;

        layer-shell = true;
        layer = "overlay";
        control-center-layer = "overlay";
        cssPriority = "user";
        notification-icon-size = 64;
        notification-body-image-height = 100;
        notification-body-image-width = 200;
        notification-inline-replies = true;
        timeout = 10;
        timeout-low = 5;
        timeout-critical = 0;
        notification-window-width = 500;
        keyboard-shortcuts = true;
        image-visibility = "when-available";
        transition-time = 200;
        hide-on-clear = true;
        hide-on-action = true;
        script-fail-notify = true;

        widgets = [
          "inhibitors"
          "dnd"
          "mpris"
          "notifications"
        ];

        widget-config = {
          inhibitors = {
            text = "Inhibitors";
            button-text = "Clear All";
            clear-all-button = true;
          };

          title = {
            text = "Notifications";
            clear-all-button = true;
            button-text = "Clear All";
          };

          dnd = {
            text = "Do Not Disturb";
          };

          label = {
            max-lines = 5;
            text = "Label Text";
          };

          mpris = {
            image-size = 96;
            blur = true;
          }; 
        };
      };
      # style = builtins.readFile "${./style.css}";
    };
  };
}

{ lib, config, ... }: {
  options = {
    wlogout.enable =
      lib.mkEnableOption "wlogout";
  };

  config = lib.mkIf config.wlogout.enable {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "lock";
          action = "hyprlock";
          text = "lock";
          keybind = "l";
        }

        {
          label = "logout";
          action = "hyprctl dispatch exit";
          text = "logout";
          keybind = "e";
        }

        {
          label = "suspend";
          action = "systemctl suspend";
          text = "suspend";
          keybind = "u";
        }

        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "hibernate";
          keybind = "h";
        }

        {
          label = "shutdown";
          action = "systemctl shutdown";
          text = "shutdown";
          keybind = "s";
        }

        {
          label = "restart";
          action = "systemctl reboot";
          text = "restart";
          keybind = "r";
        }
      ];

      style = ''
        * {
          background-image: none;
        }

        window {
	        background-color: rgba(0, 0, 0, 0.9);
        }

        button {
	        background-color: #2e3440;
	        border-style: solid;
	        border-width: 0px;
	        border-radius: 0;
	        background-repeat: no-repeat;
	        background-position: center;
	        background-size: 25%;
	        color: #5e81ac;
        }

        button:focus, button:active, button:hover {
	        background-color: #4c566a;
	        color: #81a1c1;
	        outline-style: none;
        }

        #lock {
          background-image: url("./images/lock.png");
        }

        #logout {
          background-image: url("./images/logout.png");
        }

        #suspend {
          background-image: url("./images/suspend.png");
        }

        #hibernate {
          background-image: url("./images/hibernate.png");
        }

        #shutdown {
          background-image: url("./images/shutdown.png");
        }

        #restart {
          background-image: url("./images/reboot.png");
        }
      '';
    };
  };
}

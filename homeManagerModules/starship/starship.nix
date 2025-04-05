{ lib, config, ... }: {
  options = {
    starship.enable = lib.mkEnableOption "starship";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableInteractive = true;

      settings = {
        format = lib.concatStrings [
          "[ ](#5e81ac)"
          "$os"
          "$username"
          "[](bg:#2e3440 fg:#5e81ac)"
          "$directory"
          "[](fg:base0D bg:base03)"
          "$git_branch"
          "$git_status"
          "[](fg:base0B bg:base03)"
          "$c"
          "$rust"
          "$golang"
          "$nodejs"
          "$php"
          "$java"
          "$kotlin"
          "$haskell"
          "$python"
          "[](fg:base0C bg:base03)"
          "$time"
          "[ ](fg:base03)"
          "$line_break"
          "$character"
        ];

        os = {
          disabled = false;
          style = "bg:#5e81ac fg:#eceff4";
        };

        os.symbols = {
          NixOS = "";
        };

        username = {
          show_always = true;
          style_user = "bg:#5e81ac fg:#eceff4";
          style_root = "bg:#5e81ac fg:#eceff4";
          format = "[ $user ]($style)(bg:#5e81ac fg:#eceff4)";
        };

        directory = {
          style = "bg:#81a1c1 fg:#eceff4";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = ".../";
        };

        directory.substitutions = {
          Documents = "󰈙";
          Downloads = "";
          Music = "󰝚";
          Pictures = "";
        };

        git_branch  = {
          symbol = "";
          style = "bg:base0B";
          format = "[[( $symbol $branch )](fg:base03 bg:base0B)]($style)";
        };

        git_status = {
          style = "bg:base0B";
          format = "[[($all_status$ahead_behind)](fg:base03 bg:base0B)]($style)";
        };

        nodejs = {
          symbol = "";
          style = "bg:base0C";
          format = "[[ $symbol ($version) ](fg:base03 bg:base0C)]($style)";
        };

        c = {
          symbol = "";
          style = "bg:base0C";
          format = "[[ $symbol ($version) ](fg:base03 bg:base0C)]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:base0C";
          format = "[[ $symbol ($version) ](fg:base03 bg:base0C)]($style)";
        };

        php = {
          symbol = "";
          style = "bg:base0C";
          format = "[[ $symbol ($version) ](fg:base03 bg:base0C)]($style)";
        };

        java = {
          symbol = "";
          style = "bg:base0C";
          format = "[[ $symbol ($version) ](fg:base03 bg:base0C)]($style)";
        };

        kotlin = {
          symbol = "";
          style = "bg:base0C";
          format = "[[ $symbol ($version) ](fg:base03 bg:base0C)]($style)";
        };

        haskell = {
          symbol = "";
          style = "bg:base0C";
          format = "[[ $symbol ($version) ](fg:base03 bg:base0C)]($style)";
        };

        python = {
          symbol = "";
          style = "bg:base0C";
          format = "[[ $symbol ($version) ](fg:base03 bg:base0C)]($style)";
        };

        time = {
          disabled = false;
          time_format = "%R";
          style = "bg:base03";
          format = "[[  $time ](fg:base06 bg:base03)]($style)";
        };

        scan_timeout = 10;

        line_break = {
          disabled = false;
        };

        character = {
          disabled = false;
          success_symbol = "[](bold fg:base0B)";
          error_symbol = "[](bold fg:base08)";
        };
      };
    };
  };
}

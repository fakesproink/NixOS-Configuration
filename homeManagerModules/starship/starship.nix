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
          "[](bg:#81a1c1 fg:#5e81ac)"
          "$directory"
          "[](fg:#81a1c1 bg:#8fbcbb)"
          "$git_branch"
          "$git_status"
          "[](fg:base07 bg:#88c0d0)"
          "$c"
          "$rust"
          "$golang"
          "$nodejs"
          "$php"
          "$java"
          "$kotlin"
          "$haskell"
          "$python"
          "[](fg:#88c0d0 bg:base03)"
          "$time"
          "[ ](fg:base03)"
          "$line_break"
          "$character"
        ];

        os = {
          disabled = false;
          style = "bg:#5e81ac fg:base06";
        };

        os.symbols = {
          NixOS = "";
        };

        username = {
          show_always = true;
          style_user = "bg:#5e81ac fg:base06";
          style_root = "bg:#5e81ac fg:base06";
          format = "[ $user ]($style)(bg:#5e81ac fg:base06)";
        };

        directory = {
          style = "bg:#81a1c1 fg:base06";
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
          style = "bg:#8fbcbb";
          format = "[[( $symbol $branch )](fg:#eceff4 bg:#8fbcbb)]($style)";
        };

        git_status = {
          style = "bg:#8fbcbb";
          format = "[[($all_status$ahead_behind)](fg:#eceff4 bg:#8fbcbb)]($style)";
        };

        nodejs = {
          symbol = "";
          style = "bg:#88c0d0";
          format = "[[ $symbol ($version) ](fg:base06 bg:#88c0d0)]($style)";
        };

        c = {
          symbol = "";
          style = "bg:#88c0d0";
          format = "[[ $symbol ($version) ](fg:base06 bg:#88c0d0)]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:#88c0d0";
          format = "[[ $symbol ($version) ](fg:base06 bg:#88c0d0)]($style)";
        };

        php = {
          symbol = "";
          style = "bg:#88c0d0";
          format = "[[ $symbol ($version) ](fg:base06 bg:#88c0d0)]($style)";
        };

        java = {
          symbol = "";
          style = "bg:#88c0d0";
          format = "[[ $symbol ($version) ](fg:base06 bg:#88c0d0)]($style)";
        };

        kotlin = {
          symbol = "";
          style = "bg:#88c0d0";
          format = "[[ $symbol ($version) ](fg:base06 bg:#88c0d0)]($style)";
        };

        haskell = {
          symbol = "";
          style = "bg:#88c0d0";
          format = "[[ $symbol ($version) ](fg:base06 bg:#88c0d0)]($style)";
        };

        python = {
          symbol = "";
          style = "bg:#88c0d0";
          format = "[[ $symbol ($version) ](fg:base06 bg:#88c0d0)]($style)";
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

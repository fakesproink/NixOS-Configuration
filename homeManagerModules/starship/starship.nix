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
          "[](fg:base07 bg:#a3be8c)"
          "$c"
          "$cpp"
          "$rust"
          "$golang"
          "$nodejs"
          "$php"
          "$java"
          "$kotlin"
          "$haskell"
          "$python"
          "[](fg:#a3be8c bg:base03)"
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
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
        };

        c = {
          symbol = "";
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
        };

        cpp = {
          disabled = false;
          symbol = "";
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
        };

        php = {
          symbol = "";
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
        };

        java = {
          symbol = "";
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
        };

        kotlin = {
          symbol = "";
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
        };

        haskell = {
          symbol = "";
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
        };

        python = {
          symbol = "";
          style = "bg:#a3be8c";
          format = "[[ $symbol ($version) ](fg:base06 bg:#a3be8c)]($style)";
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

{ inputs, pkgs, lib, config, ... }: {
  imports = with inputs; [
    nixvim.homeManagerModules.nixvim
  ];

  options = {
    neovim.enable =
      lib.mkEnableOption "neovim";
  };

  config = lib.mkIf config.neovim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      colorschemes.nord.enable = true;

      keymaps = [
        {
          action = "<cmd>NvimTreeToggle<CR>";
          key = "<Tab>";
        }
      ];

      plugins = {
        lualine.enable = true;
        barbar.enable = true;
        noice.enable = true;
        nui.enable = true;
        numbertoggle.enable = true;
        autoclose.enable = true;
        auto-save.enable = true;
        guess-indent.enable = true;
        comment.enable = true;
        indent-blankline.enable = true;

        presence = {
          enable = true;
          autoLoad = true;

          settings = {
            auto_update = true;
            main_image = "neovim";
            client_id = "1487037978202079232";
            enable_line_number = true;
            show_time = true;
          };
        };

        web-devicons = {
          enable = true;
          settings = {
            color_icons = true;
            strict = true;
          };
        };

        nvim-tree = {
          enable = true;
          git.enable = true;
          hijackCursor = true;
          # openOnSetup = true;
          # openOnSetupFile = true;
        };

        cmp = {
          enable = true;
          autoLoad = true;
          autoEnableSources = true;
          settings.sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "cmdline"; }
            { name = "nvim-cmp"; }
          ];
        };
      };

      extraPlugins = with pkgs.vimPlugins; [
        vim-nix
      ];
    };
  };
}

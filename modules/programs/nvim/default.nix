{nixvim, ...}: {
  imports = [
    nixvim.nixosModules.nixvim
    ./lsp.nix
    ./keymaps.nix
    ./lualine.nix
  ];

  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      updatetime = 100;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "frappe";
    };

    autoCmd = [
      {
        command = "set shiftwidth=2";
        event = [
          "BufEnter"
          "BufWinEnter"
        ];
        pattern = [
          "*.nix"
        ];
      }
      {
        command = "set nofoldenable";
        event = [
          "BufEnter"
          "BufWinEnter"
        ];
        pattern = [
          "*"
        ];
      }
    ];

    plugins = {
      markdown-preview.enable = true;
      barbecue.enable = true;

      toggleterm = {
        enable = true;
        settings = {
          direction = "vertical";
          open_mapping = "[[<C-t>]]";
          size = 50;
          shading_factor = 0;
        };
      };

      neo-tree = {
        enable = true;
        defaultComponentConfigs.container.rightPadding = 1;
        window = {width = 30;};
      };

      treesitter.enable = true;
      oil.enable = true;
      bufferline = {
        enable = true;
        diagnostics = true;
        offsets = [
          {
            filetype = "neo-tree";
            text = "";
          }
        ];
        indicator = {
          style = "icon";
          icon = "";
        };
      };
    };
  };
}

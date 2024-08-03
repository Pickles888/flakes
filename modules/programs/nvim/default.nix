{
  nixvim, 
  inputs, 
  pkgs, 
  ...
}: {
  imports = [
    nixvim.nixosModules.nixvim
    ./lsp.nix
    ./keymaps.nix
    ./lualine.nix
  ];

  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin { 
	name = "markdown.nvim";
	src = inputs.plugin-markdown;
      })
    ];
    extraConfigLua = "require('render-markdown').setup({
        code = {
	    enabled = true,
	    sign = true,
	    style = 'full',
	    left_pad = 0,
	    right_pad = 0,
	    width = 'full',
	    border = 'thin',
	    above = '▄',
	    below = '▀',
	    highlight = 'RenderMarkdownCode',
	    highlight_inline = 'RenderMarkdownCodeInline',
	},
    })";

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

    highlight = {
      GitGutterAdd.fg = "#a6d189";
      GitGutterDelete.fg = "#e78284"; 
      GitGutterChange.fg = "#838ba7";
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
      {
	command = "RenderMarkdown enable";
	event = [
	  "BufEnter"
	  "BufWinEnter"
	];
	pattern = [
	  "*.md"
	];
      }
    ];

    plugins = {
      markdown-preview.enable = true;
      barbecue.enable = true;
      mini.enable = true;
      which-key.enable = true;
      rainbow-delimiters.enable = true;

      fugitive.enable = true;
      gitgutter = {
	enable = true;
	signs = {
	  added = "";
	  modified = "";
	  removed = "";
	};
      };

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
        window.width = 30;
	closeIfLastWindow = true;
      };

      treesitter.enable = true;
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

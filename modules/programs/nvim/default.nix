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

      fugitive.enable = true;
      gitgutter = {
	enable = true;
	enableByDefault = false;
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

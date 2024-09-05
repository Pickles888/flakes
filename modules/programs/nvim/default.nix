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
      
      pkgs.tree-sitter-grammars.tree-sitter-nu
    ];
    extraConfigLua = ''
      require('render-markdown').setup({
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
      })

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      -- change the following as needed
      parser_config.nu = {
	install_info = {
	  url = "${pkgs.tree-sitter-grammars.tree-sitter-nu}", -- local path or git repo
	  files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
	  -- optional entries:
	  --  branch = "main", -- default branch in case of git repo if different from master
	  -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
	  -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	filetype = "nu", -- if filetype does not match the parser name
      }
    '';

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
      nix-develop.enable = true;

      fugitive.enable = true;
      gitgutter = {
	enable = true;
	signs = {
	  added = "";

	  modified = "";
	  modifiedAbove = "";
	  modifiedRemoved = "󰍷";

	  removed = "";
	  removedAboveAndBelow = "";
	  removedFirstLine = "";
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

      bufferline = {
        enable = true;
        settings.offsets = [
          {
            filetype = "neo-tree";
            text = "";
          }
        ];
      };
    };
  };
}

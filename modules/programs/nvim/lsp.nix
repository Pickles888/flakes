{
  lib,
  config,
  nixvim,
  pkgs,
  ...
}: let
  treesitter-nu-grammar = pkgs.tree-sitter-grammars.tree-sitter-nu;
in lib.mkIf config.nvim.enable {
  programs.nixvim.plugins = {
    rustaceanvim.enable = true; # rust
    lsp = {
      enable = true;
      servers = {
	clangd.enable = true; # cpp/c
	jdt-language-server.enable = true; # java
	nixd.enable = true; # nix
	hls.enable = true; # haskell
	marksman.enable = true; # markdown
	pylsp.enable = true; # python
	cssls.enable = true; # css
	nushell.enable = true; # nu
	gopls.enable = true; # go (google ew)
      };
    };


    treesitter = {
      enable = true;
      settings.indent.enable = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
        treesitter-nu-grammar
      ];
    };

    lsp-format.enable = true;
    cmp-nvim-lsp.enable = true;
    
    lspsaga = {
      enable = true;
      ui = {
	border = "rounded";
	codeAction = "󰌵";
      };

      codeAction = {
	extendGitSigns = false;
	showServerName = false;
      };

      lightbulb = {
	enable = false;
	sign = false;
	virtualText = true;
      };

      implement.enable = false;
    };

    luasnip = {
      enable = true;
      settings.enable_autosnippets = true;
    };

    autoclose.enable = true;
    crates-nvim.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
	snippet.expand = ''function(args) require('luasnip').lsp_expand(args.body) end'';
	sources = [
	  {name = "nvim_lsp";}
	  {name = "luasnip";}
	  {name = "buffer";}
	  {name = "path";}
	  {name = "cmp";}
	];

	mapping = {
	  "<C-n>" = "cmp.mapping.select_next_item()";
	  "<C-p>" = "cmp.mapping.select_prev_item()";
	  "<C-j>" = "cmp.mapping.select_next_item()";
	  "<C-k>" = "cmp.mapping.select_prev_item()";
	  "<C-d>" = "cmp.mapping.scroll_docs(-4)";
	  "<C-f>" = "cmp.mapping.scroll_docs(4)";
	  "<C-Space>" = "cmp.mapping.complete()";
	  "<C-e>" = "cmp.mapping.close()";
	  "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
	  "<Tab>" =
	    # lua
	    ''
	      function(fallback)
		if cmp.visible() then
		  cmp.select_next_item()
		elseif require("luasnip").expand_or_jumpable() then
		  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
		else
		  fallback()
		end
	      end
	    '';
	  "<S-Tab>" =
	    # lua
	    ''
		function(fallback)
		  if cmp.visible() then
		    cmp.select_prev_item()
		  elseif require("luasnip").jumpable(-1) then
		    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
		  else
		  fallback()
		end
	      end
	    '';
	};

	formatting = {
	  fields = ["abbr" "kind" "menu"];
	  format = ''
	    function(_, item)
	      local icons = {
		Namespace = "󰌗",
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰆧",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈚",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰊄",
		Table = "",
		Object = "󰅩",
		Tag = "",
		Array = "[]",
		Boolean = "",
		Number = "",
		Null = "󰟢",
		String = "󰉿",
		Calendar = "",
		Watch = "󰥔",
		Package = "",
		Copilot = "",
		Codeium = "",
		TabNine = "",
	      }

	      local icon = icons[item.kind] or ""
	      item.kind = string.format("%s %s", icon, item.kind or "")
	      return item
	    end
	  '';
	};

	window = {
	  completion = {
	    winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:Pmenu,Search:PmenuSel";
	    scrollbar = false;
	    max_width = 10;
	    sidePadding = 0;
	    border = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
	  };

	  documentation = {
	    border = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
	    sidePadding = 0;
	    winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
	  };
	};
      };
    };
  };
}

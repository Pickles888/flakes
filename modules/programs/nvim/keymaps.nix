{...}: {
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Neotree reveal<cr>";
      key = "<C-e>";
    }
    {
      action = "<C-o>gk";
      key = "<Up>";
      mode = "i";
    }
    {
      action = "<C-o>gj";
      key = "<Down>";
      mode = "i";
    }
    {
      action = "<cmd>bnext<cr>";
      key = "tn";
      mode = "n";
    }
    {
      action = "<cmd>bprev<cr>";
      key = "tp";
      mode = "n";
    }
    {
      action = "<cmd>bp|bd#<cr>";
      key = "td";
      mode = "n";
    }
    {
      action = "<cmd>vsplit<cr>";
      key = "<A-z>";
      mode = ["n" "i" "v"];
    }
    {
      action = "<cmd>split<cr>";
      key = "<A-x>";
      mode = ["n" "i" "v"];
    }
    {
      action = "<C-w>h";
      key = "<A-a>";
      mode = ["n" "i" "v"];
    }
    {
      action = "<C-w>j";
      key = "<A-s>";
      mode = ["n" "i" "v"];
    }
    {
      action = "<C-w>k";
      key = "<A-d>";
      mode = ["n" "i" "v"];
    }
    {
      action = "<C-w>l";
      key = "<A-h>";
      mode = ["n" "i" "v"];
    }
    {
      mode = "t";
      key = "<esc>";
      action = "<C-\\><C-n>";
    }
    {
      mode = "n";
      key = "gco";
      action = "<cmd>Git commit -a<cr>";
    }
    {
      mode = "n";
      key = "gca";
      action = "<cmd>Git commit --amend<cr>";
    }
    {
      mode = "n";
      key = "gbr";
      action = "<cmd>Git branch<cr>";
    }
    {
      mode = "n";
      key = "gr";
      action = "<Nop>";
    }
    {
      mode = "n";
      key = "grg";
      action = "<cmd>Git pull<cr>";
    }
    {
      mode = "n";
      key = "gru";
      action = "<cmd>Git push<cr>";
    }
    {
      mode = "n";
      key = "grf";
      action = "<cmd>Git fetch<cr>";
    }
    {
      mode = "n";
      key = "gbb";
      action = "<cmd>Git blame<cr>";
    }
    {
      mode = "n";
      key = "ga";
      action = "<cmd>Git add -A<cr>";
    }
    {
      mode = "n";
      key = "gll";
      action = "<cmd>Git log<cr>";
    }
    {
      mode = "n";
      key = "glg";
      action = "<cmd>Git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'<cr>";
    }
    {
      mode = "n";
      key = "gd";
      action = "<cmd>Git diff<cr>";
    }
    {
      mode = "n";
      key = "``";
      action = "<cmd>Neotree close<cr><cmd>wa<cr><cmd>qa!<cr>";
    }
  ];
}

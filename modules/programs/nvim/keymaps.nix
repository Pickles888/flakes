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
      key = "gca";
      action = "<cmd>Git commit -a<cr>";
    }
    {
      mode = "n";
      key = "gcr";
      action = "<cmd>Git rebase -i<cr>";
    }
    {
      mode = "n";
      key = "gb";
      action = "<cmd>Git blame<cr>";
    }
    {
      mode = "n";
      key = "ga";
      action = "<cmd>Git add -A<cr>";
    }
    {
      mode = "n";
      key = "gl";
      action = "<cmd>Git log<cr>";
    }
    {
      mode = "n";
      key = "gd";
      action = "<cmd>Git diff<cr>";
    }
  ];
}

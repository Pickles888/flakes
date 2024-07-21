{nixvim, ...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    globalstatus = true;
    sectionSeparators = {
      right = "";
      left = "";
    };

    componentSeparators = {
      right = "";
      left = "";
    };

    sections = {
      lualine_a = [
	{
	  icon = "";
	}
      ];

      lualine_b = [
	{
	  name = "filetype";
	}
	{
	  name = "diagnostics";
	}
      ];

      lualine_c = [
	{
	  name = "branch";
	}
	{
	  name = "diff";
	}
      ];

      lualine_x = [
	{
	  name = "encoding";
	}
      ];

      lualine_y = [
	{
	  icon = "";
	}
      ];

      lualine_z = [
	{
	  name = "filename";
	}
      ];
    };
  };
}

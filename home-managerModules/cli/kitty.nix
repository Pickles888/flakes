{
  osConfig,
  lib,
  ...
}: lib.mkIf osConfig.kitty.enable {
  programs.kitty = {
    enable = true;
    font = {
    	 name = "JetBrainsMono Nerd Font";
    	 size = osConfig.kitty.fontSize;
    };

    settings = {
      window_padding_width = 0;
      window_border_width = 0;
      confirm_os_window_close = -0;
      enabled_layouts = "splits:split_axis=horizontal";
    };

    theme = "Gruvbox Dark";
  };
}

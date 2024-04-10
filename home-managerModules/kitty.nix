{ config, lib, ... }: {
  /* options = {
       kitty.enable = lib.mkEnableOption {
         description = "Enables Kitty Terminal Editor.";
         default = true;
       };

       kitty.fontSize = lib.mkOption {
         type = lib.types.int;
         description = "Kitty's Font Size.";
         default = 14;
       };
     };
  */

  #config = {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 17; # config.kitty.fontSize;
    };

    settings = {
      window_padding_width = 5;
      confirm_os_window_close = -0;
    };

    theme = "Catppuccin-Frappe";
  };
  #};
}

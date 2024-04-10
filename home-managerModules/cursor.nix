{ config, pkgs, lib, ... }: {
  /* options = {
       cursor.customCursor.enable = lib.mkEnableOption {
         description = "Enables Custom Cursor Theme";
         default = true;
       };

       cursor.size = lib.mkOption {
         description = "Size of Cursor";
         default = 24;
         type = lib.types.int;
       };
     };
  */

  #config = lib.mkIf config.cursor.customCursor.enable {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24; # "${config.cursor.size}";
  };
  #};
}

{
  osConfig,
  pkgs,
  lib,
  ...
}: lib.mkIf osConfig.gui.enable {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = osConfig.cursor.size;
  };
}

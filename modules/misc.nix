{
  config,
  lib,
  pkgs,
  ...
}: lib.mkIf config.gui.enable {
  hardware.graphics.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    config.common.default = "*";
  };
}

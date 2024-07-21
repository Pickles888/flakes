{
  config,
  lib,
  pkgs,
  ...
}: lib.mkIf config.gui.enable {
  hardware.opengl.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };
}

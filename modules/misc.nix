{
  config,
  lib,
  pkgs,
  ...
}: lib.mkIf config.gui.enable {
  hardware.graphics.enable = true;

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
     	config.common.default = [ "gtk" "hyprland" ];
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}

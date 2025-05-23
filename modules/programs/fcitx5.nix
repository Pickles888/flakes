{ 
  pkgs,
  lib,
  config,
  ...
}: lib.mkIf config.fcitx.enable {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        rime-data
        fcitx5-gtk
        fcitx5-mozc
        fcitx5-rime
        fcitx5-table-extra
      ];

      waylandFrontend = true;
    };
  };

  services.xserver.desktopManager.runXdgAutostartIfNone = true;
}

{
  osConfig,
  config,
  lib,
  pkgs,
  ...
}: lib.mkIf osConfig.gtk.enable {
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-frappe-pink-standard+normal,rimless";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "standard";
        tweaks = ["normal" "rimless"];
        variant = "frappe";
      };
    };

    font = {
      name = "Aileron, Bold";
      size = osConfig.gtk.fontSize;
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables = {GTK_THEME = "${config.gtk.theme.name}";};

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}

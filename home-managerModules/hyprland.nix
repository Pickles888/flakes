{ config, lib, pkgs, ... }: {
  /* options = {
       hyprland.enable = lib.mkEnableOption {
         description = "Enables Hyprland";
         default = true;
       };

       hyprland.display = lib.mkOption {
         description = "Monitor Settings";
         default = "DP-1,1920x1080@240,0x0,1";
       };
     };
  */

  #config = lib.mkIf config.hyprland.enable {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = "DP-1,1920x1080@240,0x0,1"; # "${config.hyprland.display}";
      env = [
        "XCURSOR_SIZE,24"
        #"XCURSOR_THEME,${config.home.pointerCursor.name}"
        #"GTK_THEME,${config.gtk.theme.name}"
      ];

      exec-once =
        [ "swaybg -i /etc/nixos/assets/evening-sky.png" "swaync" "hypridle" ];

      input = {
        kb_layout = "us";
        kb_variant = "workman";
        follow_mouse = "1";
        accel_profile = "flat";
        sensitivity = "0.2";
      };

      general = {
        gaps_in = "10";
        gaps_out = "10";
        border_size = "0";
        layout = "dwindle";
        allow_tearing = "false";
      };

      decoration = {
        rounding = "12";
        blur = {
          enabled = true;
          size = "4";
          passes = "5";
        };

        drop_shadow = "no";
        active_opacity = "0.9";
        inactive_opacity = "0.7";
      };

      animations = {
        enabled = "yes";
        bezier = [
          "linear, 0.5, 0.5, 0.5, 0.5"
          "antiEase, 0.6, 0.4, 0.6, 0.4"
          "ease, 0.4, 0.6, 0.4, 0.6"
          "smooth, 0.5, 0.9, 0.6, 0.95"
          "htooms, 0.95, 0.6, 0.9, 0.5"
          "powered, 0.5, 0.2, 0.6, 0.5"
        ];

        animation = [
          "windows, 1, 2.5, smooth"
          "windowsOut, 1, 1, htooms, popin 80%"
          "fade, 1, 5, smooth"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      misc = { force_default_wallpaper = "0"; };

      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, F, fullscreen,"
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, N, exec, firefox"
        "$mainMod, A, exec, swaync-client -t"
        "$mainMod, Q, killactive,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, Z, togglefloating,"
        "$mainMod, SPACE, exec, anyrun"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
      ] ++ (builtins.concatLists (builtins.genList (x:
        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in [
          "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
          "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]) 10));

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
  #};
}

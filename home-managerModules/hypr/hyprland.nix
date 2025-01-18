{
  osConfig,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  resize = key: val: "$mainMod CONTROL, ${key}, resizeactive, ${val}";
  ankiCmd = "nix run nixpkgs#anki -- --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
in lib.mkIf osConfig.hyprland.enable {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = osConfig.hyprland.display;
      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,${config.home.pointerCursor.name}"
        "GTK_THEME,${config.gtk.theme.name}"
      ];

      exec-once = [
        "swaybg -i ${osConfig.flakePath}/assets/evening-sky.png"
        "swaync"
        "waybar"
        "hypridle"
        "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1"
        "xwaylandvideobridge"
      ] ++ osConfig.hyprland.extraConfig.startupApps 
	++ lib.lists.optionals osConfig.hyprland.hyprlock.asLockscreen [ "loginctl lock-session" ]
	++ lib.lists.optionals osConfig.fcitx.enable [
	  "fcitx5 -d -r"
	  "fcitx5-remote -r" 
	];


      input = {
        kb_layout = "us,us";
        kb_variant = "workman,,";
	kb_options = "grp:alt_space_toggle";
        follow_mouse = "1";
        accel_profile = "flat";
        sensitivity = "${osConfig.hyprland.sensitivity}";
        touchpad = {
          natural_scroll = true;
          scroll_factor = "0.7";
          clickfinger_behavior = true;
          tap-to-click = false;
        };
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
	
        active_opacity = "0.9";
        inactive_opacity = "0.7";
      };

      render.explicit_sync = 0; # honeykrisp...

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

      misc = {
        force_default_wallpaper = "0";
        #hide_cursor_on_key_press = true;
      };

      layerrule = ["blur,waybar"];

      windowrule = []
	++ lib.lists.optionals osConfig.fcitx.enable [ "pseudo, fcitx" ];

      windowrulev2 = [] ++ osConfig.hyprland.extraConfig.windowRules;

      "$mainMod" = "SUPER";
      bind =
        [
          "$mainMod, F, fullscreen,"
          "$mainMod, RETURN, exec, kitty"
	  "$mainMod, P, exec, kitty ${ankiCmd}"
          "$mainMod, N, exec, firefox"
	  "$mainMod, H, exec, kitty nix run nixpkgs#ghci"
          "$mainMod, A, exec, swaync-client -t"
	  "$mainMod, S, exec, iced-todo"
	  "$mainMod, L, exec, loginctl lock-session"
          "$mainMod, Y, exec, hyprshot -m region --clipboard-only"
          "$mainMod, Q, killactive,"
          "$mainMod, E, exec, nautilus"
          "$mainMod, Z, togglefloating,"
          "$mainMod, SPACE, exec, anyrun" ", XF86Search, exec, anyrun"
          "$mainMod, M, pseudo,"
          "$mainMod, X, togglesplit,"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod SHIFT, up, movewindow, u"
          "$mainMod SHIFT, left, movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, down, movewindow, d"
          "$mainMod, T, togglegroup"
          "$mainMod ALT, Z, changegroupactive, f"
          "$mainMod ALT, X, changegroupactive, b"
        ]
        ++ (builtins.concatLists (builtins.genList (x: let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
            "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ])
          10))
	++ osConfig.hyprland.extraConfig.binds
	++ lib.lists.optionals osConfig.bluetooth.enable [ "$mainMod, K, exec, blueman-manager" ];

# bindl=, XF86AudioMute, exec, amixer set Master toggle

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      binde = [
        (resize "right" "30 0")
        (resize "left" "-30 0")
        (resize "up" "0 -30")
        (resize "down" "0 30")
      ];

      bindle = [
	", XF86AudioRaiseVolume, exec, amixer set Master 1%+"
	", XF86AudioLowerVolume, exec, amixer set Master 1%-"
	", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
	", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      bindl = [
	", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	", XF86AudioPlay, exec, playerctl play-pause" 
	", XF86AudioNext, exec, playerctl next"
	", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  } // lib.attrsets.optionalAttrs osConfig.hyprland.unstable {
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
}

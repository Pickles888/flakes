{
  osConfig,
  lib,
  config,
  pkgs,
  ...
}: lib.mkIf osConfig.sway.enable {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "anyrun";

      input = {
	"type:keyboard" = {
	  xkb_layout = "us";
	  xkb_variant = "workman";
	}; 
      };

      output = {
	"DP-1" = {
          mode = "1920x1080@240Hz";
          position = "0,0";
          scale = "1.0";
        };
      };

      input = {
	"type:pointer" = {
	  accel_profile = "flat";
	  pointer_accel = "0.3";    
	};
      };

      startup = [
	{command = "swaymsg workspace 1";}
	{command = "swaybg -i ${osConfig.flakePath}/assets/houseonthesideofalake.jpg -m fill";}
      ]
	++ lib.lists.optionals osConfig.waybar.enable [{command = "waybar";}];

      bars = [{
	  mode = "dock";
	  hiddenState = "hide";
	  position = "bottom";
	  workspaceButtons = true;
	  workspaceNumbers = true;
	  statusCommand = "${pkgs.i3status}/bin/i3status";
	  fonts = {
	    names = [ "monospace" ];
	    size = 8.0;
	  };
	  trayOutput = "primary";
	  colors = {
	    background = "#282828";   # Gruvbox Dark background
	    statusline = "#ebdbb2";    # Gruvbox light text color
	    separator = "#7c6f64";     # Gruvbox muted gray-brown separator
	    focusedWorkspace = {
	      border = "#a89984";      # Gruvbox light beige border
	      background = "#3c3836";  # Gruvbox dark gray-brown background
	      text = "#ebdbb2";        # Gruvbox light beige text
	    };
	    activeWorkspace = {
	      border = "#7c6f64";      # Gruvbox muted gray-brown border
	      background = "#504945";  # Gruvbox dark gray-brown background
	      text = "#ebdbb2";        # Gruvbox light beige text
	    };
	    inactiveWorkspace = {
	      border = "#7c6f64";      # Gruvbox muted gray-brown border
	      background = "#282828";  # Gruvbox dark background
	      text = "#7c6f64";        # Gruvbox muted gray-brown text
	    };
	    urgentWorkspace = {
	      border = "#fb4934";      # Gruvbox red border
	      background = "#282828";  # Gruvbox dark background
	      text = "#ebdbb2";        # Gruvbox light beige text
	    };
	    bindingMode = {
	      border = "#fb4934";      # Gruvbox red border
	      background = "#282828";  # Gruvbox dark background
	      text = "#ebdbb2";        # Gruvbox light beige text
	  };  
	};
      }];

      colors = {
        background = "#282828";

        focused = rec {
          border = "#d79921";
          background = "#282828";
          text = "#ebdbb2";
          indicator = border;
          childBorder = border;
        };

        focusedInactive = {
          border = "#504945"; 
          background = "#282828";
          text = "#bdae93"; 
          indicator = "#665c54";
          childBorder = "#504945";
        };

        unfocused = {
          border = "#3c3836";
          background = "#282828";
          text = "#928374";
          indicator = "#3c3836";
          childBorder = "#3c3836";
        };

        urgent = {
          border = "#fb4934"; 
          background = "#282828";
          text = "#fb4934";
          indicator = "#cc241d";
          childBorder = "#fb4934";
        };

        placeholder = {
          border = "#282828";
          background = "#282828";
          text = "#928374";
          indicator = "#282828";
          childBorder = "#282828";
        };
      };

      keybindings = let 
	cfg.config = config.wayland.windowManager.sway.config;
      in {
	  "${cfg.config.modifier}+Return" = "exec ${cfg.config.terminal}";
          "${cfg.config.modifier}+Shift+q" = "kill";
          "${cfg.config.modifier}+d" = "exec ${cfg.config.menu}";

	  "XF86AudioRaiseVolume" = "exec amixer set Master 1%+";
	  "XF86AudioLowerVolume" = "exec amixer set Master 1%-";

	  "${cfg.config.modifier}+z" = "exec amixer set Master 1%-";
	  "${cfg.config.modifier}+x" = "exec amixer set Master 1%+";

	  "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
	  "XF86AudioPlay" = "exec playerctl play-pause"; 
	  "XF86AudioNext" = "exec playerctl next";
	  "XF86AudioPrev" = "exec playerctl previous";

          "${cfg.config.modifier}+${cfg.config.left}" = "focus left";
          "${cfg.config.modifier}+${cfg.config.down}" = "focus down";
          "${cfg.config.modifier}+${cfg.config.up}" = "focus up";
          "${cfg.config.modifier}+${cfg.config.right}" = "focus right";

          "${cfg.config.modifier}+Left" = "focus left";
          "${cfg.config.modifier}+Down" = "focus down";
          "${cfg.config.modifier}+Up" = "focus up";
          "${cfg.config.modifier}+Right" = "focus right";

          "${cfg.config.modifier}+Shift+${cfg.config.left}" = "move left";
          "${cfg.config.modifier}+Shift+${cfg.config.down}" = "move down";
          "${cfg.config.modifier}+Shift+${cfg.config.up}" = "move up";
          "${cfg.config.modifier}+Shift+${cfg.config.right}" = "move right";

          "${cfg.config.modifier}+Shift+Left" = "move left";
          "${cfg.config.modifier}+Shift+Down" = "move down";
          "${cfg.config.modifier}+Shift+Up" = "move up";
          "${cfg.config.modifier}+Shift+Right" = "move right";

          "${cfg.config.modifier}+b" = "splith";
          "${cfg.config.modifier}+v" = "splitv";
          "${cfg.config.modifier}+f" = "fullscreen toggle";
          "${cfg.config.modifier}+a" = "focus parent";

          "${cfg.config.modifier}+s" = "layout stacking";
          "${cfg.config.modifier}+w" = "layout tabbed";
          "${cfg.config.modifier}+e" = "layout toggle split";

          "${cfg.config.modifier}+Shift+space" = "floating toggle";
          "${cfg.config.modifier}+space" = "focus mode_toggle";

          "${cfg.config.modifier}+1" = "workspace number 1";
          "${cfg.config.modifier}+2" = "workspace number 2";
          "${cfg.config.modifier}+3" = "workspace number 3";
          "${cfg.config.modifier}+4" = "workspace number 4";
          "${cfg.config.modifier}+5" = "workspace number 5";
          "${cfg.config.modifier}+6" = "workspace number 6";
          "${cfg.config.modifier}+7" = "workspace number 7";
          "${cfg.config.modifier}+8" = "workspace number 8";
          "${cfg.config.modifier}+9" = "workspace number 9";
          "${cfg.config.modifier}+0" = "workspace number 10";

          "${cfg.config.modifier}+Shift+1" =
            "move container to workspace number 1";
          "${cfg.config.modifier}+Shift+2" =
            "move container to workspace number 2";
          "${cfg.config.modifier}+Shift+3" =
            "move container to workspace number 3";
          "${cfg.config.modifier}+Shift+4" =
            "move container to workspace number 4";
          "${cfg.config.modifier}+Shift+5" =
            "move container to workspace number 5";
          "${cfg.config.modifier}+Shift+6" =
            "move container to workspace number 6";
          "${cfg.config.modifier}+Shift+7" =
            "move container to workspace number 7";
          "${cfg.config.modifier}+Shift+8" =
            "move container to workspace number 8";
          "${cfg.config.modifier}+Shift+9" =
            "move container to workspace number 9";
          "${cfg.config.modifier}+Shift+0" =
            "move container to workspace number 10";

          "${cfg.config.modifier}+Shift+minus" = "move scratchpad";
          "${cfg.config.modifier}+minus" = "scratchpad show";

	  "${cfg.config.modifier}+Shift+f" = "exec fcitx5 -r";
          "${cfg.config.modifier}+Shift+c" = "reload";
          "${cfg.config.modifier}+Shift+e" =
            "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

          "${cfg.config.modifier}+r" = "mode resize";
	  "${cfg.config.modifier}+Shift+s" = ''exec grim -g "$(slurp -d)" - | wl-copy'';
      };
    };
  };
}

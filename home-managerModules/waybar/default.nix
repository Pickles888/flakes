{
  lib,
  osConfig,
  ...
}: lib.mkIf osConfig.waybar.enable {
  xdg.configFile = {
    "waybar/caway.sh" = {
      source = ./caway.sh;
    };

    "waybar/config.jsonc".text = ''
      {
	  // "layer": "bottom", // Waybar at top layer
	  // "position": "bottom", // Waybar position (top|bottom|left|right)
	  //"height": 0, // Waybar height (to be removed for auto height)
	  // "width": 1280, // Waybar width
	  "margin": 5,
	  "spacing": ${toString osConfig.waybar.spacing}, // Gaps between modules (4px)
	  // Choose the order of the modules
	  "modules-left": [
	      "custom/nixos",
	      "hyprland/workspaces",
	      "custom/caway"
	  ],
	  "modules-right": [
	      "pulseaudio",
	      "network",
	      "battery",
	      "custom/jpdate",
	      "clock"
	  ],

	  // Modules configuration
	  "hyprland/workspaces": {
	       "disable-scroll": true,
	       "all-outputs": true,
	       "warp-on-scroll": false,

	      "persistent-workspaces": { "*": 5 }
	  },

	  "custom/nixos": {
	      "format": "",
	      "on-click": "kitty nh os switch && exit",
	      "on-click-right": "kitty ${
		if lib.strings.hasPrefix "/home/asynth/" osConfig.flakePath
		  then ""
		  else "sudo "
	      }nix flake update ${osConfig.flakePath} && exit"
	  },

	  "custom/media": {
	      "max-length": ${toString osConfig.waybar.mediaMaxLength},
	      "format": "{}",
	      "interval": 1,
	      "exec": "playerctl metadata --format '󰎈 {{title}} - {{artist}}' | xargs",
	      "tooltip": false,
	      "on-click": "playerctl play-pause",
	      "on-scroll-up": "playerctl volume 0.05+",
	      "on-scroll-down": "playerctl volume 0.05-"
	  },

	  "custom/caway": {
	      "max-length": ${toString osConfig.waybar.mediaMaxLength},
	      "format": "{icon} {}",
	      "format-icons": {
		  "Playing": "", // Uncomment if not using caway
		  "Paused": "",
	      },
	      "escape": true,
	      "tooltip": true,
	      "exec": "~/.config/waybar/caway.sh -f 120 -b 12",
	      "return-type": "json",
	      "hide-empty-text": true,
	      "on-click": "playerctl play-pause",
	      "on-scroll-up": "playerctl volume 0.05+",
	      "on-scroll-down": "playerctl volume 0.05-",
	  },

	  "custom/date": {
	      "format": "{}",
	      "exec": " date +' %a %d %b' ",
	      "tooltip": false,
	      "interval": 10
	  },

	  "clock": {
	      "format": "  {:%I:%M}",
	      "tooltip-format": "<big>{:%Y:%B}</big>\n<tt><small>{calendar}</small></tt>"
	  },

	  "battery": {
	      "states": {
		  // "good": 95,
		  "warning": 30,
		  "critical": 15
	      },
	      "format": "{icon} {capacity}",
	      "format-full": "󱈏",
	      "format-charging": "󰂄 {capacity}",
	      "format-plugged": " {capacity}",
	      "format-icons": ["󰂎", "󰁺", "󰁼", "󰁽", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
	  },

	  "network": {
	      // "interface": "wlp2*", // (Optional) To force the use of this interface
	      "format-wifi": "{icon} {essid}",
	      "format-ethernet": "󰈀 Ethernet",
	      "tooltip-format": "{ifname} via {gwaddr}",
	      "format-linked": "{ifname} (No IP)",
	      "format-disconnected": "󰤭 ",
	      "format-alt": "{ifname}: {ipaddr}/{cidr}",
	      "format-icons": [ "󰤯", "󰤟", "󰤢", "󰤥", "󰤨" ]
	  },
	  "pulseaudio": {
	      // "scroll-step": 1, // %, can be a float
	      "format": "{icon} {volume}",
	      "format-bluetooth": "󰂰 {volume}",
	      "format-bluetooth-muted": "󰂰 ",
	      "format-muted": " ",
	      "format-icons": {
		  "headphone": "󰋋",
		  "hands-free": "󰋋",
		  "headset": "󰋋",
		  "phone": "",
		  "portable": "",
		  "car": "",
		  "default": ["", "", ""]
	      },
	      "on-click": "pavucontrol"
	  }
      }
    '';

    "waybar/latte.css".text = ''
      @define-color rosewater #f2d5cf;
      @define-color flamingo #eebebe;
      @define-color pink #f4b8e4;
      @define-color mauve #ca9ee6;
      @define-color red #e78284;
      @define-color maroon #ea999c;
      @define-color peach #ef9f76;
      @define-color yellow #e5c890;
      @define-color green #a6d189;
      @define-color teal #81c8be;
      @define-color sky #99d1db;
      @define-color sapphire #85c1dc;
      @define-color blue #8caaee;
      @define-color lavender #babbf1;
      @define-color text #c6d0f5;
      @define-color subtext1 #b5bfe2;
      @define-color subtext0 #a5adce;
      @define-color overlay2 #949cbb;
      @define-color overlay1 #838ba7;
      @define-color overlay0 #737994;
      @define-color surface2 #626880;
      @define-color surface1 #51576d;
      @define-color surface0 #414559;
      @define-color base #303446;
      @define-color mantle #292c3c;
      @define-color crust #232634;
    '';

    "waybar/style.css".text = ''
      @import "latte.css";

      * {
	  /* `otf-font-awesome` is required to be installed for icons */
	  font-family: 'JetbrainsMono Nerd Font';
	  font-weight: bold;
	  font-size: ${toString osConfig.waybar.textSize}px;
	  border: none;
	  border-radius: 0;
	  min-height: 0;
	  margin: 2px;
	  padding: 0px;
      }

      window#waybar {
	  background: alpha(@base, 0.8);
	  border-radius: 100px;
	  color: @text;
	  transition-property: background-color;
	  transition-duration: .5s;
      }

      window#waybar.hidden {
	  opacity: 0.2;
      }

      /*
      window#waybar.empty {
	  background-color: transparent;
      }
      window#waybar.solo {
	  background-color: #FFFFFF;
      }
      */

      button {
	  /* Use box-shadow instead of border so the text isn't offset */
	  box-shadow: inset 0 -3px transparent;
	  /* Avoid rounded borders under each button name */
	  border: none;
	  border-radius: 0;
      }


      #workspaces button {
	  padding: 0 2px;
	  background-color: transparent;
	  color: @text;
      }

      #workspaces button:hover {
	  color: @overlay2;
	  transition: all 0.2s ease-in-out;
      }

      #workspaces button.active {
	  color: @overlay2;
	  transition: all 0.2s ease-in-out;
      }

      #workspaces button.focused {
	  background-color: @pink;
      }

      #workspaces button.urgent {
	  color: @red;
      }

      #mode {
	  background-color: #64727D;
	  box-shadow: inset 0 -3px #ffffff;
      }

      #custom-nixos,
      #custom-media,
      #custom-date,
      #wireplumber
      #workspaces,
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #mpd,
      #custom-jpdate,
      #custom-caway {
	  box-shadow: 0px 0px 3px @crust;
	  color: @text;
	  background-color: @crust;
	  border-radius: 100px;
	  padding-left: 15px;
	  padding-right: 15px;
      }

      #window,
      #workspaces {
	  font-size: 15px;
	  background-color: @crust;
	  box-shadow: 0px 0px 3px @crust;
	  border-radius: 100px;
	  padding-left: 15px;
	  padding-right: 15px;
      }

      #custom-nixos {
	  font-size: 20px;
	  padding-left: 10px;
	  padding-right: 17px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
	  margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
	  margin-right: 0;
      }

      #custom-caway {  
	padding-right: 17px;
	transition: all 0.4s ease-in-out;
      }

      #custom-caway.Playing {
	  background: rgb(137, 180, 250);
	  background: radial-gradient(circle, rgba(137, 180, 250, 120) 0%, rgba(142, 179, 250, 120) 6%, rgba(148, 226, 213, 1) 14%, rgba(147, 178, 250, 1) 14%, rgba(155, 176, 249, 1) 18%, rgba(245, 194, 231, 1) 28%, rgba(158, 175, 249, 1) 28%, rgba(181, 170, 248, 1) 58%, rgba(205, 214, 244, 1) 69%, rgba(186, 169, 248, 1) 69%, rgba(195, 167, 247, 1) 72%, rgba(137, 220, 235, 1) 73%, rgba(198, 167, 247, 1) 78%, rgba(203, 166, 247, 1) 100%);
	  color: @crust;
	  font-weight: bold;
	  text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377);
	  background-size: 400% 400%;
      }

      #custom-music.Paused,
      #custom-music.Stopped {
	  color: @text;
      }
    '';
  }; 
}

{
  osConfig,
  lib,
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

      bars = [];

      output = {
	"DP-1" = {
          mode = "1920x1080@240Hz";
	  bg = "${osConfig.flakePath}/assets/wallpaper_not_avalible.png fill";
          position = "0,0";
          scale = "1.0";
        };
      };

      input = {
	"type:pointer" = {
	  accel_profile = "flat";
	  pointer_accel = "0.5";    
	};
      };

      startup = [
	{command = "waybar";}
        {command = "firefox";}
	{command = "swaymsg workspace 1";}
      ];

      colors = {
        background = "#282828";

        focused = rec {
          border = "#d79921";
          background = "#282828";
          text = "#ebdbb2";
          indicator = "#b8bb26";
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
    };
  };
}

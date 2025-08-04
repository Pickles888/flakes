{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    hostName = lib.mkOption {
      type = lib.types.str;
      description = "Hostname of the entire system";
    };

    wifi.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables wifi";
    };

    gui.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enables the gui";
    };

    kakoune.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enables the Kakoune Editor";
    };

    musicManager.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Custom made music manager with nushell :P + FZF";
    };

    gtk = {
      enable = lib.mkOption {
	type = lib.types.bool;
	default = config.gui.enable;
	description = "Enables gtk";
      };

      fontSize = lib.mkOption {
	type = lib.types.ints.unsigned;
	default = 14;
	description = "Font size for gtk apps";
      };
    };

    tty = {
      autologin.enable = lib.mkOption {
	type = lib.types.bool;
	default = config.gui.enable;
	description = "Autologin for tty";
      };
    };

    printing.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.gui.enable;
      description = "Enables cups (printing)";
    };

    firewall = {
      allowedTCPPorts = lib.mkOption {
	type = lib.types.listOf lib.types.port;
	description = "A list of allowed TCP ports";
	default = [];
      };

      allowedUDPPorts = lib.mkOption {
	type = lib.types.listOf lib.types.port;
	description = "A list of allowed UDP ports";
	default = [];
      };
    };

    bluetooth.enable = lib.mkOption {
      description = "Enables Bluetooth";
      default = config.gui.enable;
      type = lib.types.bool;
    };

    audio.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.gui.enable;
      description = "Enables audio";
    };

    vm.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables qemu vm";
    };

    steam.enable = lib.mkOption {
      description = "Enables steam";
      default = config.gui.enable;
      type = lib.types.bool;
    };

    sway.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.gui.enable;
      description = "Enables sway";
    };

    hyprland = let
      hyprEnabled = config.gui.enable && config.hyprland.enable;
    in {
      enable = lib.mkOption {
	type = lib.types.bool;
	default = false;
	description = "Enables hyprland";
      };

      unstable = lib.mkOption {
	type = lib.types.bool;
	default = hyprEnabled;
	description = "Enables hyprland unstable";
      };
      
      hyprlock = {
	enable = lib.mkOption {
	  type = lib.types.bool;
	  default = hyprEnabled;
	  description = "Locks computer after ${config.hyprland.hypridle.timeoutSecs}";
	};

	timeoutSecs = lib.mkOption {
	  type = lib.types.ints.unsigned;
	  default = 600;
	  description = "Time until computer locks";
	};

	asLockscreen = lib.mkOption {
	  type = lib.types.bool;
	  default = config.hyprland.hyprlock.enable;
	  description = "Use Hyprlock as your lockscreen";
	};

	suspend = lib.mkOption {
	  type = lib.types.bool;
	  default = false;
	  description = "Suspends computer after ${toString config.hyprland.hyprlock.suspendSecs}";
	};
	
	suspendSecs = lib.mkOption {
	  type = lib.types.ints.unsigned;
	  default = 1800;
	  description = "Seconds until hyprlock suspends";
	};
      };
      
      sensitivity = lib.mkOption {
	type = lib.types.str;
	description = "Hyprland's sensitivity as a string";
	default = "0";
      };

      display = lib.mkOption {
	type = lib.types.str;
	description = "Hyprland's display setting";
	default = ",preferred,auto,1";
      };

      extraConfig = {
	startupApps = lib.mkOption {
	  type = lib.types.listOf lib.types.str;
	  default = [];
	  description = "Extra apps to run when hyprland is started";
	};
	
	windowRules = lib.mkOption {
	  type = lib.types.listOf lib.types.str;
	  default = [];
	  description = "Extra window rules";
	};

	binds = lib.mkOption {
	  type = lib.types.listOf lib.types.str;
	  default = [];
	  description = "Extra binds";
	};
      };
    };

    fcitx.enable = lib.mkOption {
      description = "Chinese + Japanese Keyboard";
      default = config.gui.enable;
      type = lib.types.bool;
    };

    ssh = {
      enable = lib.mkOption {
	description = "Enables SSH";
	default = false;
	type = lib.types.bool;
      };

      port = lib.mkOption {
	type = lib.types.port;
        default = 22;
	description = "SSH Port Number";
      };
    };

    swaync.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.gui.enable;
      description = "Enables sway notification center";
    };

    anyrun.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.gui.enable;
      description = "Enables anyrun";
    };

    kitty = {
      enable = lib.mkOption {
	type = lib.types.bool;
	default = config.gui.enable;
	description = "Enables kitty terminal emulator";
      };
      
      fontSize = lib.mkOption {
	type = lib.types.ints.unsigned;
	default = 15;
	description = "Font size of kitty";
      };
    };

    fontPackages = {
      enable = lib.mkOption {
	type = lib.types.bool;
	default = config.gui.enable;
	description = "Enables extra font packages";
      };

      extraFonts = lib.mkOption {
	type = lib.types.listOf lib.types.package;
	default = [];
	description = "A list of extra font packages";
      };
    };

    autoUpgrade.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enables Auto Upgrading the Flake";
    };

    flakePath = lib.mkOption {
      type = lib.types.str;
      default = "/etc/nixos";
      description = "Loaction of Flakes";
    };

    packages = {
      guiPackages.enable = lib.mkOption {
	description = "Enables GUI Packages";
	default = config.gui.enable;
	type = lib.types.bool;
      };

      basePackages.enable = lib.mkOption {
	description = "Enables base Packages";
	default = true;
	type = lib.types.bool;
      };

      remove = lib.mkOption {
	description = "Removes packages in the list from the packages used";
	default = [];
	type = lib.types.listOf lib.types.package;
      };

      extraPackages = lib.mkOption {
	description = "Adds packages to the current list of packages";
	default = [];
	type = lib.types.listOf lib.types.package;
      };
    };

    shell = {
      shell = lib.mkOption {
	type = lib.types.enum [ pkgs.zsh pkgs.nushell ];
	default = pkgs.nushell;
	description = "What shell is used; either zsh or nushell";
      };

      extraAliases = lib.mkOption {
	type = lib.types.attrs;
	default = {};
	description = "An attribute set of extra shell aliases";
      };
    };

    git = {
      userName = lib.mkOption {
	type = lib.types.str;
	default = "";
	description = "Git username";
      };

      userEmail = lib.mkOption {
	type = lib.types.str;
	default = "";
	description = "Git email";
      };
    };

    waybar = {
      enable = lib.mkOption {
	type = lib.types.bool;
	default = config.gui.enable && config.hyprland.enable;
      };

      textSize = lib.mkOption {
	type = lib.types.ints.unsigned;
	default = 16;
      };

      spacing = lib.mkOption {
        type = lib.types.ints.unsigned;
	default = 4;
      };

      mediaMaxLength = lib.mkOption {
	type = lib.types.ints.unsigned;
	default = 64;
      };
    };

    cursor = {
      enable = lib.mkOption {
	type = lib.types.bool;
	default = config.gui.enable;
      };

      size = lib.mkOption {
	type = lib.types.ints.unsigned;
	default = 24;
	description = "Cursor size";
      };
    };
  };

  config = {
    networking.hostName = config.hostName;
    security.polkit.enable = config.sway.enable; 
  };
}

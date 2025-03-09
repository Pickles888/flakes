{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  getNuFiles = files: lib.concatMapStrings (file: (builtins.readFile file) + "\n") files;
  extraConfig = getNuFiles [ ./config.nu ];
  extraEnv = getNuFiles [ ./env.nu ./functions.nu ];

  # functions dependent on nix variables
  nixFunctions = ''
    def gh-clone [repository] { 
      git clone $"https://github.com/${osConfig.git.userName}/($repository)"
    } 
  '';
in lib.mkIf (osConfig.shell.shell == pkgs.nushell) {
  programs = {
    nushell = {
      enable = true;
      extraConfig = extraConfig;
      extraLogin = lib.mkIf osConfig.hyprland.enable ''
	if (tty) == "/dev/tty1" {
	  exec Hyprland
	} else {
	  nitch	
	}
      '';

      extraEnv = lib.strings.concatStrings [extraEnv nixFunctions];

      shellAliases = rec {
	c = "clear";
	cdf = "cd ${osConfig.flakePath}";
        ez = "eza --icons -F -H --group-directories-first --git -1";
        eza = "${ez} -T";
        t = "tmux";
	s = "superfile";
      } // osConfig.shell.extraAliases;
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    starship = {
      enable = true;
      settings = {
        continuation_prompt = "[:::](surface0)";
        palette = "gruvbox_dark";
        nix_shell.format = "in [$symbol]($style)";

        character = {
          success_symbol = "[~>](bold teal)";
          error_symbol = "[/>](bold maroon)";
          vimcmd_symbol = "[->](bold green)";
        };

        directory = {
          truncation_length = 4;
          style = "bold blue";
        };

        palettes = {
          catppuccin_frappe = {
            maroon = "#ea999c";
            green = "#a6d189";
            teal = "#81c8be";
            blue = "#8caaee";
            surface0 = "#282828";
          };
        };
      };
    };
  };
}

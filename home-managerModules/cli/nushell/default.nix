{
  osConfig,
  lib,
  pkgs,
  ...
}: let 
  extraConfig = builtins.readFile ./config.nu;
  extraEnv = builtins.readFile ./env.nu;
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

      extraEnv = extraEnv;

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
        palette = "catppuccin_frappe";
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
            rosewater = "#f2d5cf";
            flamingo = "#eebebe";
            pink = "#f4b8e4";
            mauve = "#ca9ee6";
            red = "#e78284";
            maroon = "#ea999c";
            peach = "#ef9f76";
            yellow = "#e5c890";
            green = "#a6d189";
            teal = "#81c8be";
            sky = "#99d1db";
            sapphire = "#85c1dc";
            blue = "#8caaee";
            lavender = "#babbf1";
            text = "#c6d0f5";
            subtext1 = "#b5bfe2";
            subtext0 = "#a5adce";
            overlay2 = "#949cbb";
            overlay1 = "#838ba7";
            overlay0 = "#737994";
            surface2 = "#626880";
            surface1 = "#51576d";
            surface0 = "#414559";
            base = "#303446";
            mantle = "#292c3c";
            crust = "#232634";
          };
        };
      };
    };
  };
}

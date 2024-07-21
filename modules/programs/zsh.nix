{
  config,
  ...
}: let
  fetch = "nitch";
  initScript = ''
    if [ $(tty) = /dev/tty1 ]; then
      exec Hyprland
    else
      ${fetch}
    fi
  '';
in {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
      interactiveShellInit = initScript;
      shellAliases = rec {
	cdf = "cd ${config.flakePath}";
	c = "clear && ${fetch}";
        ls = "eza --icons -F -H --group-directories-first --git -1";
        lsa = "${ls} -T";
        t = "tmux";
      } // config.extraAliases;
    };

    starship = {
      enable = true;
      presets = ["nerd-font-symbols"];
      settings = {
        continuation_prompt = "[❯ ](surface0)";
        palette = "catppuccin_frappe";
        # right_format = "[$custom](surface2)";
        # custom.time = {
        #   command = lib.strings.concatStrings ["/etc/nixos/modules/programs/zsh/" pkgs.system "-fancy-time.bin"];
        #   when = true;
        #   format = "$output";
        # };

        battery = {
          full_symbol = "󱈑";
          charging_symbol = "󰂄";
          discharging_symbol = "󱟤";
          unknown_symbol = "󰂑";
          empty_symbol = "󰂎";
          format = "$symbol";
          display = {
            threshold = 10;
            style = "bold red";
          };
        };

        nix_shell.format = "in [$symbol]($style)";

        character = {
          success_symbol = "[❯](teal)";
          error_symbol = "[❯](maroon)";
          vimcmd_symbol = "[❮](green)";
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

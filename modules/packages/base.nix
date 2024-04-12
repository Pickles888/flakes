{ config, pkgs, lib, inputs, ... }: {
  options = {
    guiPackages.enable = lib.mkEnableOption {
      description = "Enables GUI Packages";
      default = true;
    };
  };

  config = lib.mkMerge [
    {
      environment.systemPackages = with pkgs; [
        swaynotificationcenter
        cava
        cider
        obsidian
        firefox
        hypridle
        hyprlock
        brightnessctl
        discord
        wofi
        pavucontrol
        waybar
        swaybg
        libnotify
        gnome.nautilus
        #inputs.nixpkgs-olympus.packages.${pkgs.system}.olympus
      ];
    }

    {
      environment.systemPackages = with pkgs; [
        eza
        wget
        fastfetch
        git
        gh
        killall
        libarchive
      ];
    }
  ];
}

/* { config, lib, pkgs, ... }: {
     options = {
       packages.gui.enable = lib.mkEnableOption {
         description = "Enable GUI Programs";
         default = true;
       };
     };

     config = lib.mkIf config.packages.gui.enable {
       environment.systemPackages = with pkgs; [
         swaynotificationcenter
         cava
         cider
         kitty
         obsidian
         firefox
         hypridle
         hyprlock
         hyprland
         brightnessctl
         discord
         wofi
         waybar
         swaybg
         steam
         gnome.nautilus
       ];
     };
   }
*/

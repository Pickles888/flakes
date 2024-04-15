{ config, pkgs, lib, inputs, ... }:
let
  guiPackages = import ./guiPackages.nix { inherit pkgs; };
  basePackages = import ./basePackages.nix { inherit pkgs; };
in {
  options = {
    packages.guiPackages.enable = lib.mkEnableOption {
      description = "Enables GUI Packages";
      default = true;
    };

    packages.basePackages.enable = lib.mkEnableOption {
      description = "Enbles base Packages";
      default = true;
    };
  };

  config = lib.mkMerge [
    { environment.systemPackages = basePackages.basePackages; }
    { environment.systemPackages = guiPackages.guiPackages; }
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

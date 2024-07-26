{
  pkgs,
  ...
}: {
  imports = [ ./hardware-configuration.nix ./asahi ];

  hostName = "NixLaptop";
  flakePath = "/home/asynth/.flakes";

  grub.enable = false;
  bluetooth.enable = true;
  workman.enable = true;
  wifi.enable = true;

  git = {
    userName = "Pickles888";
    userEmail = "verysaltypickles@gmail.com";
  };
  
  gui.enable = true;

  steam.enable = false;
  kitty.fontSize = 12;

  waybar = {
    spacing = 2;
    textSize = 14;
    mediaMaxLength = 35;
  };
  
  hyprland = {
   sensitivity = "0";
   display = ",highres,auto,2";
 };

 packages.extraPackages = with pkgs; [
    dissent
 ];
}

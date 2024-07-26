{
  pkgs,
  ...
}: {
  imports = [ ./hardware-configuration.nix ./asahi ];

  hostName = "NixLaptop";
  flakePath = /home/asynth/.flakes;

  grub.enable = false;
  bluetooth.enable = true;
  workman.enable = true;
  
  gui.enable = true;

  steam.enable = false;
  
  hyprland = {
   sensitivity = "0";
   display = ",highres,auto,2";
  };
}

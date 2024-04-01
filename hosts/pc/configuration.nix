{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./main.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  networking.hostName = "nixos";
  
  console = {
    useXkbConfig = true;
  };

  system.autoUpgrade = {
    enable = true;
    channel = https://nixos.org/channels/nixos-unstable;
  };

  system.stateVersion = "23.11"; # DO NOT TOUCH
}

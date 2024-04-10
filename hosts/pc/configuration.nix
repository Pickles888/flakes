{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  bluetooth.enable = true;
  grub.enable = true;
  workman.enable = true;

  networking.hostName = "pc";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.11";
}

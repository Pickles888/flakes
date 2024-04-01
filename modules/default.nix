{ config, pkgs, ... }:

{
  imports = [
    ./modules/bluetooth.nix
    ./modules/environment.nix
    ./modules/location.nix
    ./modules/services.nix
    ./modules/boot.nix
    ./modules/firewall.nix
    ./modules/sound.nix
    ./modules/dm.nix
    ./modules/keyboard.nix
    ./modules/user.nix
    ./packages/fonts.nix
    ./packages/packages.nix
    ./modules/programs/general.nix
    ./modules/programs/zsh.nix
  ];
}

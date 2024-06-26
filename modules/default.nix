{ config, pkgs, ... }:

{
  imports = [
    ./environment.nix
    ./location.nix
    ./boot.nix
    ./keyboard.nix
    ./user.nix
    ./misc.nix
    ./services/bluetooth.nix
    ./services/sound.nix
    ./services/general.nix
    ./services/getty.nix
    ./packages/fonts.nix
    ./packages/pkgsMain.nix
    ./packages/pkgsOptions.nix
    ./programs/general.nix
    ./programs/zsh.nix
    ./programs/steam.nix
  ];
}

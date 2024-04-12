{ config, pkgs, ... }: {
  imports = [
    ./gtk.nix
    ./cursor.nix
    ./kitty.nix
    ./helix.nix
    ./hyprland.nix
    ./homePackages.nix
    ./anyrun.nix
    ./git.nix
    ./swaync.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./fastfetch.nix
  ];

  home = {
    homeDirectory = "/home/asynth";
    username = "asynth";
    stateVersion = "23.11";
  };
}

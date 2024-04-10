{ config, osConfig, ... }: {
  imports = [
    ./gtk.nix
    ./cursor.nix
    ./kitty.nix
    ./helix.nix
    ./hyprland.nix
    ./homePackages.nix
  ];

  home = {
    homeDirectory = "/home/asynth";
    username = "asynth";
    stateVersion = "23.11";
  };
}

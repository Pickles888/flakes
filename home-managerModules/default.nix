{...}: {
  imports = [ 
    ./homePackages.nix 
    ./cli 
    ./gtk.nix
    ./hypr  
    ./swaync.nix
    ./anyrun.nix
    ./waybar
    ./sway.nix
    ./mpv.nix
  ];

  home = {
    homeDirectory = "/home/asynth";
    username = "asynth";
    stateVersion = "23.11";
  };
}

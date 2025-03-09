{...}: {
  imports = [ 
    ./homePackages.nix 
    ./cli 
    ./gtk.nix
    ./hypr  
    ./swaync.nix
    ./cursor.nix
    ./anyrun.nix
    ./waybar
    ./sway.nix
  ];

  home = {
    homeDirectory = "/home/asynth";
    username = "asynth";
    stateVersion = "23.11";
  };
}

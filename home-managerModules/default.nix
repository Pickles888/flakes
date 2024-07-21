{...}: {
  imports = [ 
    ./homePackages.nix 
    ./cli 
    ./gtk.nix
    ./hypr  
    ./swaync.nix
    ./cursor.nix
    ./anyrun.nix
    ./waybar.nix
  ];

  home = {
    homeDirectory = "/home/asynth";
    username = "asynth";
    stateVersion = "23.11";
  };
}

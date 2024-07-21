{...}: {
  imports = [
    ./pkgsMain.nix
    ./pkgsOverlays.nix
    ./fonts.nix
    ./autoUpgrade.nix 
  ];

  nixpkgs.config.allowUnfree = true;
}

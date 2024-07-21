{...}: {
  imports = [
    ./environment.nix
    ./location.nix
    ./boot.nix
    ./keyboard.nix
    ./user.nix
    ./misc.nix
    ./ssh.nix
    ./flakePath.nix
    ./options.nix
    
    ./services
    ./programs 
    ./packages
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "23.11";
  programs.nix-ld.enable = true;
}

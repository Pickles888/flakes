{...}: {
  imports = [./hardware-configuration.nix];

  hostName = "NixPC"; # host name of system, same as outputs.nixosConfigurations.<name>
  flakePath = "/home/asynth/.flakes"; # path to flakes

  workman.enable = true;
  vm.enable = true; # enables qemu vm
  autoUpgrade.enable = true; # Automatically updates the flake every day
  
  gui.enable = true; # enables/disables gui related options by default

  hyprland = {
    sensitivity = "0.2";
    display = "DP-1,1920x1080@240,0x0,1";
  };
  
  git = {
    userName = "Pickles888";
    userEmail = "verysaltyasynth@gmail.com";
  };

  ssh = {
    enable = false;
    port = 23;
  };

  firewall = {
    allowedUDPPorts = [161 162 9100 427 5353];
    allowedTCPPorts = [161 162 9100];
  };

  location = {
    locale = "en_US.UTF-8";
    timeZone = "America/Los_Angeles";
  };
}

{
  pkgs,
  inputs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  hostName = "NixPC"; # host name of system, same as outputs.nixosConfigurations.<name>
  flakePath = "/home/asynth/.flakes"; # path to flakes

  workman.enable = true;
  vm.enable = true; # enables qemu vm
  autoUpgrade.enable = true; # Automatically updates the flake every day
  kitty.fontSize = 14;

  gui.enable = true; # enables/disables gui related options by default

  waybar.mediaMaxLength = 100;

  hyprland = {
    sensitivity = "0.2";
    display = "DP-1,1920x1080@240,0x0,1,vrr,1";
  };
  
  git = {
    userName = "Pickles888";
    userEmail = "verysaltypickles@gmail.com";
  };

  ssh = {
    enable = false;
    port = 23;
  };

  firewall = {
    allowedUDPPorts = [161 162 9100 427 5353];
    allowedTCPPorts = [161 162 9100]
      ++ [ 47984 47989 47990 48010 ]; # sunshine ports
  };

  location = {
    locale = "en_US.UTF-8";
    timeZone = "America/Los_Angeles";
  };

  packages.extraPackages = (with pkgs; [
    modrinth-app
    discord
    via
    vesktop
    anki-bin
  ]) ++ [ inputs.ow-mod-man.packages."x86_64-linux".owmods-gui pkgs.mono ];

  # Sunshine
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  networking.firewall.allowedUDPPortRanges = [
    { from = 47998; to = 48000; }
    { from = 8000; to = 8010; }
  ];
}

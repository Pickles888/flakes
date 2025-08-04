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
  kitty.fontSize = 13;

  musicManager.enable = true;

  gui.enable = true; # enables/disables gui related options by default

  waybar.mediaMaxLength = 100;

  hardware.amdgpu.opencl.enable = true;

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
    allowedTCPPorts = [161 162 9100];
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
    ghc
    lumafly
    pipeline
    (pkgs.callPackage ../../modules/packages/customPackages/tilp2.nix {}).tilp
    protonvpn-gui
    mangohud
    # CD STUFF
    cdrtools
    dvdplusrwtools
  ]) ++ [ inputs.ow-mod-man.packages."x86_64-linux".owmods-gui pkgs.mono ];

  networking.firewall.allowedUDPPortRanges = [
    { from = 47998; to = 48000; }
    { from = 8000; to = 8010; }
  ];

  # fix lumafly
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20" # broken af
    "dotnet-sdk-wrapped-7.0.410" # also broken af
    "dotnet-sdk-7.0.410"
  ];

  # VPN

  networking.networkmanager.enable = true;

   networking.wg-quick.interfaces."wg0" = {
      autostart = false;
      privateKeyFile = "/root/secrets/protonvpn";
      address = [ "10.2.0.2/32" ];
      listenPort = 51820;

      # peers = [
      #  { publicKey = cfg.endpoint.publicKey;
      #    allowedIPs = [ "0.0.0.0/0" "::/0"];
      #    endpoint = "${cfg.endpoint.ip}:${builtins.toString cfg.endpoint.port}";
      #  }
      #];
    };
}

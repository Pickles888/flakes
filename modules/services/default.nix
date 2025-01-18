{
  config,
  ...
}: {
  imports = [
    ./bluetooth.nix
    ./audio.nix
    ./firewall.nix
    ./autologin.nix
    ./wifi.nix
  ];

  services = {
    flatpak.enable = config.gui.enable;
    printing.enable = config.gui.enable;
    xserver.enable = false;
    ratbagd.enable = config.gui.enable;
  };
}

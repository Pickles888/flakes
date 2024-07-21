{...}: {
  imports = [
    ./bluetooth.nix
    ./audio.nix
    ./firewall.nix
    ./xserver.nix
    ./printing.nix
    ./autologin.nix
  ];
}

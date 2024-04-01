{ config, ... }:

{
  networking = {
    firewall = {
      #networking.firewall.allowedTCPPorts = [];
      #networking.firewall.allowedUDPPorts = [];
    };
  };
}

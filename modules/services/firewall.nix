{
  config,
  ...
}: {
  networking.firewall.allowedTCPPorts = config.firewall.allowedTCPPorts ++ [ config.ssh.port ];
  networking.firewall.allowedUDPPorts = config.firewall.allowedUDPPorts;
}

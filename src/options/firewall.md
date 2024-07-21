# Firewall

Options for firewall.
Please use this instead of `networking.firewall` for opening ports.

Example:
```nix
{
  firewall = {
    allowedTCPPorts = [ 231 4124 8080 ];
    allowedUDPPorts = [ 3000 323 8080 ];
  };
}
```

## firewall.allowedTCPPorts
Allowed TCP ports in firewall

type: `listOf port`

Example:
```nix
{
  firewall.allowedTCPPorts = [ 148 4412 123 8080 ];
}
```

## firewall.allowedUDPPorts
Allowed UDP ports in firewall

type: `listOf port`

Example:
```nix
{
  firewall.allowedUDPPorts = [ 123 456 8080 ];
}
```

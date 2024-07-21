# SSH

SSH options.

Example:
```nix
{
  ssh = {
    enable = true;
    port = 23;
  };
}
```

## ssh.enable
Enables ssh

type: `bool`

default: `false`

Example:
```nix
{
  ssh.enable = true;
}
```

## ssh.port
Port for ssh, will also open port for you

type: `port`

Example:
```nix
{
  ssh.port = 23;
}
```

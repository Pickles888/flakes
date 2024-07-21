# Options

Options declared in `hosts/<filename/configuration.nix`

GUI related options can be found in GUI Options

## hostName
System host name

type: `String`

Example:
```nix
{
  hostName = "NixPC";
}
```

## flakePath
Path to flakes

type: `path`

default: `/etc/nixos`

Example:
```nix
{
  flakePath = /home/user/.flakes;
}
```

## vm.enable
Enables qemu vm

type: `bool`

default: `false`

Example:
```nix
{
  vm.enable = true;
}
```

## autoUpgrade.enable
Automatically updates the flake every day

type: `bool`

default: `false`

Example:
```nix
{
  autoUpgrade.enable = true;
}
``` 

## extraAliases
Extra aliases for the shell

type: `attribute set`

Example: 
```nix
{
  extraAliases = {
    crowdstrike = "sudo rm -rf /* --no-preserve-root";
  };
}
```

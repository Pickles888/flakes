# Package Options

Package options / extra packages.

Example:
```nix
{
  packages = {

  };
}
```

## packages.guiPackages.enable
Enables GUI packages.

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  packages.guiPackages.enable = true;
}
```

## packages.basePackages.enable
Enables the base set of CLI and system packages.

type: `bool`

default: `true`

Example:
```nix
{
  packages.basePackages.enable = true;
}
```

## packages.remove
A list of packages to remove from the base set of packages.
Useful for alternate architectures.

type: `listOf package`

Example:
```nix
{
  packages.remove = with pkgs; [
    some-package
    x86-64-only-package
    my-sanity
  ];
}
```

## packages.extraPackages
A list of packages to add to the base set of packages.

type: `listOf package`

Example:
```nix
{
  packages.extraPackages = with pkgs; [
    package
    other-package
    beans
  ];
}
```

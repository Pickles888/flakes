# Font Packages

Font package options.

Example:
```nix
{
  fontPackages = {
    enable = true;
    extraFonts = (with pkgs; [ fira-code ]);
  };
}
```

## fontPackages.enable
Enable the custom font packages.

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  fontPackages.enable = true;
}
```

## fontPackages.extraFonts
Extra font packages.

type: `listOf packages`

default: `<gui.enable>`

Example:
```nix
{
  fontPackages.extraFonts = [ pkgs.fira-code ];
}
```

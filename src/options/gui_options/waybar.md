# Waybar

Waybar status bar configuration.

Example:
```nix
{
  waybar = {
    enable = true;
    size = 1;
  };
}
```

## waybar.enable
Enables waybar.

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  waybar.enable = true;
}
```

## waybar.size
Size of waybar.

type: `unsigned int`

default: `2`

Example:
```nix
{
  waybar.size = 3;
}
```

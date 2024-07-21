# Hyprland

Options for Hyprland.

## hyprland.enable
Enables Hyprland.

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  hyprland.enable = true;
}
```

## hyprland.sensitivity
Hyprland's mouse sensitivity. Represented as a string because you cannot have an option with a float for some reason.

type: `string`

default: `"0"`

Example:
```nix
{
  hyprland.sensitivity = "0.2";
}
```

## hyprland.display
Hyprland's display setting. 
See: [https://wiki.hyprland.org/Configuring/Monitors/](https://wiki.hyprland.org/Configuring/Monitors/)

type: `string`

default: `",preffered,auto,1"`

Example:
```nix
{
  hyprland.display = "DP-1,1920x1080@144,0x0,1";
}
```

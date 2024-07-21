# Extra Config for Hyprland

Extra config for Hyprland.

Example:
```nix
{
  hyprland.extraConfig = {
    startupApps = [ "firefox" "steam -silent"];
    binds = [ "$mainMod, B, exec, steam" ];
    windowRules = [ "float,^(kitty)$" ];
  };
}
```

## hyprland.extraConfig.startupApps
Extra apps to start with Hyprland.

type: `listOf string`

Example: 
```nix
{
  hyprland.extraConfig.startupApps = [ "firefox" "steam -silent"];
}
```

## hyprland.extraConfig.windowRules
Extra window rules for Hyprland.

type: `listOf string`

Example:
```nix
{
  hyprland.extraConfig.windowRules = [ "float,^(kitty)$" ];
}
```

## hyprland.extraConfig.binds
Extra binds for Hyprland.

type: `listOf string`

Example:
```nix
{
  hyprland.extraConfig.binds = [ "$mainMod, B, exec, steam" ];
}
```

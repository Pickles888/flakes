# Hyprlock

Options for Hyprlock, the lockscreen for hyprland

Example:
```nix
{
  hyprland.hyprlock = {
    enable = true;
    asLockscreen = true;
    timeoutSecs = (30 * 60); # 30 minutes
  };
}
```

## hyprland.hyprlock.enable
Enables hyprlock.

type: `bool`

default: `true`

Example:
```nix
{
  hyprland.hyprlock.enable = true;
}
```

## hyprland.hyprlock.timeoutSecs
Seconds until hyprlock activates.

type: `unsigned int`

default: `600` (10 minutes)

Example:
```nix
{
  hyprland.hyprlock.timeoutSecs = (15 * 60); # 15 minutes
}
```

## hyprland.hyprlock.asLockscreen
Start hyprlock on startup as your lockscreen.

type: `bool`

default: `true`

Example:
```nix
{
  hyprland.hyprlock.asLockscreen = true;
}

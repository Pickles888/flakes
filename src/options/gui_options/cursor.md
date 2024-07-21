# Cursor

Cursor options.

Example:
```nix
{
  cursor = {
    enable = true;
    size = 32;
  };
}
```

## cursor.enable
Enables a custom cursor

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  cursor.enable = true;
}
```

## cursor.size
Cursor's size.

type: `int`

default: `24`

Example:
```nix
{
  cursor.size = 32;
}
```

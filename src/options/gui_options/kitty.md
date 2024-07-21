# Kitty

Options for Kitty terminal editor.

Example:
```nix
{
  kitty = {
    enable = true;
    fontSize = 17;
  };
}
```

## kitty.enable
Enables kitty terminal editor.

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  kitty.enable = true;
}
```

## kitty.fontSize
Font size for kitty.

type: `unsigned integer`

default: `15`

Example:
```nix
{
  kitty.fontSize = 13;
}
```

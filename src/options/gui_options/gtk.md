# GTK

GTK Options.

Example:
```nix
{
  gtk = {
    enable = true;
    fontSize = 17;
  };
}
```

## gtk.enable
Enable GTK

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  gtk.enable = true;
}
```

## gtk.fontSize
GTK fontSize

type: `unsigned int`

default: `14`

Example:
```nix
{
  gtk.fontSize = 12;
}
```

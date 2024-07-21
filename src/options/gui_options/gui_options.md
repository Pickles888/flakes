# GUI Options

GUI options.

All of them can be turned on/off by default with the `gui.enable` option.

## gui.enable
Enables or disables GUI by default, affected options can still be changed.

type: `bool`

default: `true`

Example:
```nix
{
  gui.enable = false;
}
```

## tty.autologin.enable
Autologin to the tty, used in place of display manager when GUI is in use.

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  tty.autologin.enable = false;
}
```

## printing.enable
Enables cups (printing)

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  printing.enable = true;
}
```

## bluetooth.enable
Enables bluetooth 

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  bluetooth.enable = true;
}
```

## audio.enable
Enables sound

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  audio.enable = true;
}
```

## steam.enable
Enables steam

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  steam.enable = true;
}
```

## swaync.enable
Enables sway notificaion center

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  swaync.enable = true;
}
```

## anyrun.enable 
Enables anyrun app launcher

type: `bool`

default: `<gui.enable>`

Example:
```nix
{
  anyrun.enable = true;
}
```  

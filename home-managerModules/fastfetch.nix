{ config, ... }: {
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "kitty-direct",
        "source": "/etc/nixos/assets/purple-nixos-fastfetch.png",
        "width": 16,
        "height": 6
      },
      "display": {
    	 "separator": " ● "
      },
      "modules": [
        "title",
        {
    	   "key": "󰒓",
    	   "format": "NixOS",
    	   "type": "custom"
        },
        {
    	   "type": "kernel",
    	   "key": "󰌽"
        },
        {
    	   "type": "shell",
    	   "key": "󱆃"
        },
        {
    	   "type": "wm",
    	   "key": "󱂬"
        },
        {
    	    "type": "colors",
    	    "symbol": "circle",
    	    "block": {
    		    "range": 10
    	    }
        }
      ]
    }
  '';
}

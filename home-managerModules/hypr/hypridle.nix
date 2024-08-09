{
  osConfig,
  lib,
  ...
}: lib.mkIf (osConfig.hyprland.enable && osConfig.hyprland.hyprlock.enable) {
  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
        lock_cmd = pidof hyprlock || hyprlock       # avoid starting multiple hyprlock instances.
    }

    listener {
        timeout = ${toString osConfig.hyprland.hyprlock.timeoutSecs}
        on-timeout = loginctl lock-session
    }

    ${if osConfig.hyprland.hyprlock.suspend
      then ''
	listener {
	  timeout = ${toString osConfig.hyprland.hyprlock.suspendSecs}
	  on-timeout = systemctl suspend                # suspend pc
	}
      ''
      else ''''
    }
  '';
}

{
  pkgs, 
  config, 
  lib,
  inputs
}: {
  guiPackages = (with pkgs; [
    cava
    lumafly
    xwaylandvideobridge
    librewolf
    hypridle
    hyprlock
    hyprshot
    jdk17
    xdg-desktop-portal-hyprland
    vscode
    brightnessctl
    wofi
    alsa-utils
    xdg-utils
    gnome.gnome-calculator
    gnome.gnome-clocks
    inkscape
    pavucontrol
    swaybg
    libnotify
    zathura
    viu
    wf-recorder
    playerctl
    hyprshot
    signal-desktop
    gnome.nautilus
  ]) 
  ++ lib.lists.optionals config.swaync.enable [ pkgs.swaynotificationcenter ]
  ++ lib.lists.optionals config.waybar.enable [ pkgs.waybar ]
  ++ [ inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins ];
}


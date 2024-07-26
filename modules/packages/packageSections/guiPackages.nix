{
  pkgs, 
  config, 
  lib
}: {
  guiPackages = (with pkgs; [
    cava
    lumafly
    xwaylandvideobridge
    firefox
    hypridle
    hyprlock
    hyprshot
    jdk17
    xdg-desktop-portal-hyprland
    vscode
    brightnessctl
    wofi
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
    mdbook
    gnome.nautilus
  ]) 
  ++ lib.lists.optionals config.swaync.enable [ pkgs.swaynotificationcenter ]
  ++ lib.lists.optionals config.waybar.enable [ pkgs.waybar ];
}

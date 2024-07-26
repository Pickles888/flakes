{
  pkgs, 
  config, 
  lib
}: {
  guiPackages = (with pkgs; [
    cava
    lumafly
    #modrinth-app
    xwaylandvideobridge
    firefox
    hypridle
    hyprlock
    hyprshot
    jdk17
    xdg-desktop-portal-hyprland
    vscode
    brightnessctl
    #discord
    #vesktop
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
    #via
    wf-recorder
    playerctl
    hyprshot
    gnome.nautilus
  ]) 
  ++ lib.lists.optionals config.swaync.enable [ pkgs.swaynotificationcenter ]
  ++ lib.lists.optionals config.waybar.enable [ pkgs.waybar ];
}

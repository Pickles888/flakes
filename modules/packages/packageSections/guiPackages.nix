{
  pkgs, 
  config, 
  lib,
  inputs
}: let
  iced-todo = pkgs.callPackage ../customPackages/iced_todo.nix {};
in {
  guiPackages = (with pkgs; [
    cava
    superfile
    yt-dlp
    xwaylandvideobridge
    hypridle
    firefox
    hyprlock
    amberol
    hyprshot
    brightnessctl
    wofi
    alsa-utils
    xdg-utils
    gnome-calculator
    gnome-clocks
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
    nautilus
    gnome-music
    jq # required by waybar/cava.sh
  ])
  ++ lib.lists.optionals config.swaync.enable [ pkgs.swaynotificationcenter ]
  ++ lib.lists.optionals config.waybar.enable [ pkgs.waybar ]
  ++ [ inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins ]
  ++ [ iced-todo ];
}


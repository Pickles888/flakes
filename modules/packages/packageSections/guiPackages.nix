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
    lumafly
    xwaylandvideobridge
    hypridle
    firefox
    hyprlock
    hyprshot
<<<<<<< HEAD
    jdk17 
=======
    jdk17
>>>>>>> 9d2960d1f0c243bc81fca0064e515e308121a8d9
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
<<<<<<< HEAD
    anki-bin
    jq # required by waybar/cava.sh
=======
>>>>>>> 9d2960d1f0c243bc81fca0064e515e308121a8d9
  ])
  ++ lib.lists.optionals config.swaync.enable [ pkgs.swaynotificationcenter ]
  ++ lib.lists.optionals config.waybar.enable [ pkgs.waybar ]
  ++ [ inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins ]
  ++ [ iced-todo ];
}


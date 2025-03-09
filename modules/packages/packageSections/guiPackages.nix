{
  pkgs, 
  config, 
  lib,
  inputs
}: let
  iced-todo = pkgs.callPackage ../customPackages/iced_todo.nix {};
in {
  guiPackages = (with pkgs; [
    yt-dlp
    xwaylandvideobridge
    firefox
    amberol
    brightnessctl
    alsa-utils
    xdg-utils
    gnome-calculator
    gnome-clocks
    inkscape
    pavucontrol
    libnotify
    zathura
    wf-recorder
    signal-desktop
    nautilus
  ])
  ++ lib.lists.optionals config.swaync.enable [ 
      pkgs.swaynotificationcenter 
    ]
  ++ lib.lists.optionals config.waybar.enable (with pkgs; [ 
      waybar
      cava
      playerctl
      jq # required by waybar/cava.sh
    ])
  ++ lib.lists.optionals config.hyprland.enable (with pkgs; [
      hyprshot
      hyprlock
      hypridle
      swaybg
    ])
  ++ [ inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins ]
  ++ [ iced-todo ];
}


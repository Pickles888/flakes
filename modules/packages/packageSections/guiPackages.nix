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
    kdePackages.xwaylandvideobridge
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
      jq # required by waybar/cava.sh
    ])
  ++ lib.lists.optionals config.hyprland.enable (with pkgs; [
      hyprshot
      hyprlock
      hypridle
    ])
  ++ lib.lists.optionals config.sway.enable (with pkgs; [
      slurp
      grim
      wl-clipboard
    ])
  ++ lib.lists.optionals (config.hyprland.enable || config.sway.enable) [pkgs.swaybg]
  ++ lib.lists.optionals (config.waybar.enable || config.sway.enable || config.hyprland.enable) [pkgs.playerctl]
  ++ [ inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins ]
  ++ [ iced-todo ];
}


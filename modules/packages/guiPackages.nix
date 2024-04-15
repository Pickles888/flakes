{ pkgs }: rec {
  guiPackages = with pkgs; [
    swaynotificationcenter
    cava
    cider
    obsidian
    firefox
    hypridle
    hyprlock
    hyprshot
    brightnessctl
    discord
    wofi
    pavucontrol
    waybar
    swaybg
    libnotify
    viu
    via
    hyprshot
    libsForQt5.polkit-kde-agent
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    gnome.nautilus
  ];
}

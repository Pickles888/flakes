{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    fastfetch
    eza
    cava
    swaynotificationcenter
    cider
    vim
    neovim
    wget
    kitty
    fastfetch
    git
    firefox
    obsidian
    gh
    hypridle
    hyprlock
    brightnessctl
    discord
    wofi
    waybar
    swaybg
    killall
    steam
    vscodium
    nodejs_21
    gnome.nautilus
  ];
}


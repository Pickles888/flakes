{
  pkgs, 
  config, 
  lib,
  inputs,
  ctools
}:
let
  #iced-todo = pkgs.callPackage ../customPackages/iced_todo.nix {};
  myKakoune =
  let
    config = pkgs.writeTextFile (rec {
      name = "kakrc.kak";
      destination = "/share/kak/autoload/${name}";
      text = import ../../programs/kakoune.nix;
    });
  in
  pkgs.kakoune.override {
    plugins = with pkgs.kakounePlugins; [ config kakoune-rainbow tabs-kak kakboard fzf-kak ];
  };
in
{
  guiPackages = with pkgs; [
    kdePackages.xwaylandvideobridge
    firefox
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
    gapless
  ]
  ++ (ctools.switchList [
    {
      switch = config.swaync.enable;
      pkgs = [ 
        pkgs.swaynotificationcenter 
      ];
    }
    {
      switch = config.waybar.enable;
      pkgs = [ 
        pkgs.waybar
      ];
    }
    {
      switch = config.hyprland.enable;
      pkgs = (with pkgs; [
        hyprshot
        hyprlock
        hypridle
      ]);
    }
    {
      switch = config.sway.enable;
      pkgs = (with pkgs; [
        slurp
        grim
        wl-clipboard
        swayimg
      ]);
    }
    {
      switch = (config.hyprland.enable || config.sway.enable);
      pkgs = [ pkgs.swaybg ];
    }
    {
      switch = (config.waybar.enable || config.sway.enable || config.hyprland.enable);
      pkgs = [ pkgs.playerctl ];
    }
    {
      switch = config.kakoune.enable;
      pkgs = [ myKakoune pkgs.haskellPackages.haskell-language-server pkgs.kakoune-lsp ];
    }
  ])
  ++ [ inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins ];
}


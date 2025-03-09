{
  pkgs,
  lib,
  osConfig,
  inputs,
  ...
}: {
  home.packages = [] 
    ++ lib.lists.optionals osConfig.hyprland.enable [ pkgs.kdePackages.polkit-kde-agent-1 ]
    ++ lib.lists.optionals osConfig.anyrun.enable [ pkgs.anyrun ]
    ++ lib.lists.optionals osConfig.hyprland.unstable [ inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland ];
}

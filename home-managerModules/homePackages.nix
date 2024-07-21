{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  home.packages = (with pkgs; []) 
    ++ lib.lists.optionals osConfig.gui.enable [ pkgs.kdePackages.polkit-kde-agent-1 ]
    ++ lib.lists.optionals osConfig.anyrun.enable [ pkgs.anyrun ];
}

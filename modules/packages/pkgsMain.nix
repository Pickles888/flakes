{
  pkgs,
  lib,
  config,
  ctools,
  inputs,
  ...
}: let
  guiPackages = import ./packageSections/guiPackages.nix {inherit inputs pkgs config lib ctools;};
  basePackages = import ./packageSections/basePackages.nix {inherit inputs pkgs config lib ctools;};

  guiPackagesCleaned = lib.lists.subtractLists config.packages.remove guiPackages.guiPackages;
  basePackagesCleaned = lib.lists.subtractLists config.packages.remove basePackages.basePackages;
in {
  environment.systemPackages = []
    ++ (ctools.switchList [
      {
        switch = config.packages.guiPackages.enable;
        pkgs = guiPackagesCleaned;
      }
      {
        switch = config.packages.basePackages.enable;
        pkgs = basePackagesCleaned;
      }
    ])
    ++ config.packages.extraPackages;
}

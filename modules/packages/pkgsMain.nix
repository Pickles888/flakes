{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  guiPackages = import ./packageSections/guiPackages.nix {inherit pkgs inputs lib config;};
  basePackages = import ./packageSections/basePackages.nix {inherit pkgs config lib;};

  guiPackagesRemoved = lib.lists.subtractLists config.packages.remove guiPackages.guiPackages;
  basePackagesRemoved = lib.lists.subtractLists config.packages.remove basePackages.basePackages;
in {
  environment.systemPackages = [] 
    ++ lib.lists.optionals config.packages.guiPackages.enable guiPackagesRemoved
    ++ lib.lists.optionals config.packages.basePackages.enable basePackagesRemoved
    ++ config.packages.extraPackages;
}

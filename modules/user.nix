{ config, pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    users.asynth = {
      isNormalUser = true;
      description = "asynth";
      extraGroups = [ "networkmanager" "wheel" "audio" "networkmanager" "lp" "scanner" "libvirtd" ];
    };
  };
}

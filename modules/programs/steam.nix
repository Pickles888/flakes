{ config, pkgs, lib, ... }: {
  /* options = {
       steam.enable = lib.mkEnableOption {
         description = "Enables steam";
         default = true;
       };
     };
  */

  #config = lib.mkIf config.steam.enable {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };
  #};
}

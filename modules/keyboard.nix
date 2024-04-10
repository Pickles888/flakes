{ config, lib, ... }:

{
  options = {
    workman.enable = lib.mkEnableOption {
      default = true;
      description = "enable workman keyboard layout";
    };
  };
  
  config = lib.mkIf config.workman.enable {
    services.xserver.xkb = {
        layout = "us";
        variant = "workman";
    };
  };
}

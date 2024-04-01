{ config, ... }:

{
  services = {
    openssh = {
      enable = true;
    };
    
    xserver = {
      enable = true;
    };

    printing.enable = true;
    blueman.enable = true;
  };
}

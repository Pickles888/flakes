{ config, ... }: {
  services = {
    xserver = {
      enable = false;
    };

    printing.enable = true;
  };
}

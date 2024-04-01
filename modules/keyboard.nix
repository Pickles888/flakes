{ config, ... }:

{
  services.xserver.xkb = {
      layout = "us";
      variant = "workman";
  };
}

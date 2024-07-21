{
  config,
  lib,
  ...
}: lib.mkIf config.bluetooth.enable {
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Enable = "Source,Sink,Media,Socket";
  };
}

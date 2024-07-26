{
  config,
  lib,
  ...
}: lib.mkIf config.wifi.enable {
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
}

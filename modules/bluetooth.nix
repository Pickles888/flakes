{ config, lib, ... }: {
  options = {
    bluetooth.enable = {
      lib.mkEnableOption "enables bluetooth";
  };

  hardware.bluetooth = lib.mkIf config.bluetooth.enable {
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
}

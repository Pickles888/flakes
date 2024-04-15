{ config, lib, ... }: {
  options = {
    bluetooth.enable = lib.mkEnableOption {
      description = "Enables Bluetooth";
      default = false;
    };
  };

  config = lib.mkIf config.bluetooth.enable {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      settings = { General = { Enable = "Source,Sink,Media,Socket"; }; };
    };
  };
}

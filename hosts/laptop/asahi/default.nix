{
  lib,
  ...
}: {
  imports = [ ./apple-silicon-support ];

  hardware = {
    asahi = {
      enable = true;
    
      withRust = true;
    
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "overlay";

      peripheralFirmwareDirectory = ./firmware;
    };
    
    opengl = {
      enable = true;
    };
  };

  boot = {
    loader.grub.enable = true;
    extraModprobeConfig = ''
      options hid_apple iso_layout=0
    '';
    kernelParams = [ "apple_dcp.show_notch=1" ];
    consoleLogLevel = 0;
  };

  environment.sessionVariables.WLR_DRM_DEVICES = "/dev/dri/card0";
}

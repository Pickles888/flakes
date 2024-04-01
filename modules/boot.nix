{ config, pkgs, ... }:

{
  boot = {
    bootspec.enable = true;
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
      };
      
      timeout = 5;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    initrd = {
      kernelModules = ["amdgpu"];
      verbose = false;
    };

    kernelParams = [
      "quiet"
      "vga=current"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    
    consoleLogLevel = 0;
  };
}

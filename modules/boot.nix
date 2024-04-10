{ config, pkgs, lib, ... }: {
  options = {
    grub.enable = lib.mkEnableOption {
      description = "enables grub";
      default = true;
    };
  };

  config = lib.mkIf config.grub.enable {
    boot = {
      bootspec.enable = true;
      loader = {
        efi = { canTouchEfiVariables = true; };

        grub = {
          enable = true;
          devices = [ "nodev" ];
          efiSupport = true;
        };

        timeout = 5;
      };

      kernelPackages = pkgs.linuxPackages_latest;
      initrd = {
        kernelModules = [ "amdgpu" ];
        verbose = false;
      };

      kernelParams = [ "quiet" "rd.udev.log_level=3" "udev.log_priority=3" ];

      consoleLogLevel = 0;
    };
  };
}

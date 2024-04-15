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
          configurationLimit = 10;
          theme = pkgs.sleek-grub-theme.override {
            withStyle = "dark";
            withBanner = "Welcome to NixOS";
          };
        };

        timeout = 5;
      };

      kernelPackages = pkgs.linuxPackages_latest;
      initrd = {
        kernelModules = [ "amdgpu" ];
        verbose = false;
      };

      kernelParams = [
        "quiet"
        ''GRUB_CMDLINE_LINUX_DEFAULT="quiet splash sky2.disable_msi=1"''
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];

      consoleLogLevel = 0;
    };
  };
}

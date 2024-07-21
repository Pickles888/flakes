{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    grub.enable = lib.mkOption {
      type = lib.types.bool;
      description = "enables grub";
      default = true;
    };
  };

  config = lib.mkIf config.grub.enable {
    boot = {
      bootspec.enable = true;
      loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          devices = ["nodev"];
          efiSupport = true;
          configurationLimit = 10;
          theme = pkgs.sleek-grub-theme.override {
            withStyle = "dark";
            withBanner = "Welcome to ${config.hostName}";
          };
        };

        timeout = 5;
      };

      kernelPackages = pkgs.linuxPackages_latest;
      initrd = {kernelModules = ["amdgpu"];};
    };
  };
}

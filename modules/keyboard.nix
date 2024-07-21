{
  config,
  lib,
  ...
}: {
  options = {
    workman.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "enable workman keyboard layout";
    };
  };

  config = lib.mkIf config.workman.enable {
    services.xserver.xkb = {
      layout = "us";
      variant = "workman";
    };
  };
}

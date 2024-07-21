{
  lib,
  config,
  ...
}: lib.mkIf config.printing.enable {
  services.printing.enable = true;
}

{
  config,
  lib,
  ...
}: lib.mkIf config.gui.enable {
  hardware.graphics.enable = true;
}

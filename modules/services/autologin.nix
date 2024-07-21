{
  lib,
  config,
  ...
}: lib.mkIf config.tty.autologin.enable {
  services.getty.autologinUser = "asynth";
}

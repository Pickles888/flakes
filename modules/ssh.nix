{
  config,
  lib,
  ...
}: lib.mkIf config.ssh.enable {
  services.openssh = {
    enable = true;
    ports = [config.ssh.port];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      X11Forwarding = false;
      PermitRootLogin = "yes";
    };
  };
}

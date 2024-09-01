{
  config,
  ...

}: {
  users = {
    defaultUserShell = config.shell.shell;
    users.asynth = {
      createHome = true;
      home = "/home/asynth";
      isNormalUser = true;
      description = "asynth";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "networkmanager"
        "lp"
        "cups"
        "scanner"
        "libvirtd"
      ];
    };
  };
}

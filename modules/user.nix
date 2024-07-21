{
  pkgs,
  ...
}: {
  users = {
    defaultUserShell = pkgs.zsh;
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

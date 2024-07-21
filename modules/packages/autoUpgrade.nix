{
  config,
  lib,
  ...
}: lib.mkIf config.autoUpgrade.enable {
  system.autoUpgrade = {
    enable = true;
    flake = config.flakePath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "daily";
    operation = "boot";
  };
}

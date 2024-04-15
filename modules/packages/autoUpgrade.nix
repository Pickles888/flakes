{ config, lib, inputs, ... }: {
  options = {
    autoUpgrade.enable = lib.mkEnableOption {
      default = false;
      description = "Enables Auto Upgrading the Flake";
    };
  };

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };
}

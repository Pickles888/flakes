{
  lib,
  config,
  pkgs,
  ...
}: lib.mkIf config.vm.enable {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
	enable = true;
	packages = [
	  (pkgs.OVMF.override {
	    secureBoot = true;
	    tpmSupport = true;
	  })
	  .fd
	];
      };
    };
  };

  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

  users.extraUsers.asynth.extraGroups = ["libvirtd"];
}

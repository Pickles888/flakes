{...}: {
  nixpkgs.overlays = [
    (final: prev: {
      catppuccin-gtk = prev.catppuccin-gtk.overrideAttrs (old: {
	src = prev.fetchFromGitHub {
	  owner = "catppuccin";
	  repo = "gtk";
	  rev = "v${old.version}";
	  fetchSubmodules = true;
	  hash = "sha256-q5/VcFsm3vNEw55zq/vcM11eo456SYE5TQA3g2VQjGc=";
	};
	postUnpack = "";
      });
    })
  ];
}

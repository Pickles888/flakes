{
  osConfig,
  lib,
  pkgs,
  ...
}: lib.mkIf osConfig.gui.enable {
  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
	scripts = with pkgs.mpvScripts; [
	  mpris
	];

	mpv = pkgs.mpv-unwrapped.override {
	  waylandSupport = true;
	};
      }
    );

    config = {
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}

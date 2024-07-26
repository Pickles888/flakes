{ 
  lib,
  osConfig,
  ... 
}: lib.mkIf osConfig.anyrun.enable {
  xdg.configFile."anyrun/config.ron".text = ''
    Config(
      x: Fraction(0.5),
      y: Absolute(0),
      width: Fraction(0.9),
      height: Absolute(0),
      hide_icons: false,
      ignore_exclusive_zones: false,
      layer: Overlay,
      hide_plugin_info: false,
      close_on_click: false,
      show_results_immediately: false,
      max_entries: None,
      plugins: [
        "libapplications.so",
	"librink.so",
	"libshell.so",
	"libtranslate.so",
	"libdictionary.so"
      ],
    )
  '';
}

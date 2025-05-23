{ 
  config, 
  lib,
  ...
}: lib.mkIf config.audio.enable {
  security.rtkit.enable = true;
  services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire.adjust-sample-rate = {
        "context.properties" = {
          "default.clock.rate" = 192000;
          "default.allowed-rates" =  [ 44100 48000 88200 96000 176400 192000 352800 384000 ];
        };
      };
   };
}

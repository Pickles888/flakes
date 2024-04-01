{ config, ... }:

{
  services.greetd = {
    enable = true;
    settings = rec {
    initial_session = {
      command = "Hyprland";
      user = "asynth";
    };

    default_session = initial_session;
    };
  };
}

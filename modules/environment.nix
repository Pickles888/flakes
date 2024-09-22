{...}: {
  environment = {
    variables = {
      EDITOR = "nvim";
      TERM = "kitty";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      PATH = "/home/asynth/.cargo/bin:$PATH";
    };
  };
}

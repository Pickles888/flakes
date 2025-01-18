{...}: {
  environment = {
    variables = {
      EDITOR = "nvim";
      TERM = "kitty";
    };

    sessionVariables = rec {
      NIXOS_OZONE_WL = "1";
      PATH = "/home/asynth/.cargo/bin:$PATH";
      GOPATH = "/home/asynth/.go";
      GOMODCACHE = "${GOPATH}/pkg/mod";
    };
  };
}

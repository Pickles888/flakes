{
  config,
  ...
}: {
  environment.sessionVariables = rec {
    FLAKE = config.flakePath;
    NH_FLAKE = FLAKE;
  };
}

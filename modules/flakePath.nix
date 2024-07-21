{
  config,
  ...
}: {
  environment.sessionVariables.FLAKE = config.flakePath;
}

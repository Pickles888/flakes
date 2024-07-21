{...}: {
  environment = {
    variables = {
      EDITOR = "vim";
      TERM = "kitty";
    };

    sessionVariables = {NIXOS_OZONE_WL = "1";};
  };
}

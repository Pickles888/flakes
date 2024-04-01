{ config, ... }:

{
  environment = {
    etc."Clearday.jpg".source = ../assets/Clearday.jpg;
    variables = {
      EDITOR = "vim";
      TERM = "kitty";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}

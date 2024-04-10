{ config, lib, pkgs, ... }: {
  /* options = {
       helix.enable = lib.mkEnableOption {
         description = "Enables the helix editor.";
         default = true;
       };
     };
  */

  #config = lib.mkIf config.helix.enable {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_frappe";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };

    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
    }];
  };
  # };
}

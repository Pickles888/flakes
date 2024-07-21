{...}: {
  imports = [
    ./zsh.nix
    ./steam.nix
    ./vm.nix
    ./nvim
  ];

  programs.dconf.enable = true;
}

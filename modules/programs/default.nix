{...}: {
  imports = [
    ./zsh.nix
    ./steam.nix
    ./vm.nix
    ./fcitx5.nix
  ];

  programs.dconf.enable = true;
}

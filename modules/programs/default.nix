{...}: {
  imports = [
    ./zsh.nix
    ./steam.nix
    ./vm.nix
    ./fcitx5.nix
    ./nvim
  ];

  programs.dconf.enable = true;
}

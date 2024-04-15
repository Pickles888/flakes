{ pkgs }: rec {
  basePackages = with pkgs; [
    eza
    wget
    fastfetch
    git
    cmus
    mpv
    gh
    killall
    libarchive
    sshfs
    bat
  ];
}

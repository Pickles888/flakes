{pkgs}: {
  basePackages = with pkgs; [
    eza
    wget
    git
    cmus
    mpv
    killall
    libarchive
    sshfs
    bat
    ffmpeg
    nil
    nh
    neovim
    nitch
    nix-output-monitor
    himalaya
    fuse
    fzf
    unzip
  ];
}
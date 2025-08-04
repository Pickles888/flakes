{
  pkgs,
  config,
  lib,
  ctools,
  inputs
}: {
  basePackages = with pkgs; [
    yt-dlp
    pciutils
    eza
    cava
    ripgrep
    fd
    dust
    pass
    gnupg
    wget
    git
    cmus
    killall
    libarchive
    sshfs
    bat
    ffmpeg
    nil
    nh
    nitch
    nix-output-monitor
    himalaya
    fuse
    fzf
    unzip
    ghc
  ] ++ ctools.switchList [
    {
      switch = config.waybar.enable;
      pkgs = [ pkgs.jq ];
    }
  ];
}

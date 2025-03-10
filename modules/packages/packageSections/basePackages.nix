{
  pkgs,
  config,
  lib
}: {
  basePackages = with pkgs; [
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
  ] ++ lib.lists.optionals config.kakoune.enable (with pkgs;
      [kakoune kakoune-lsp]
    );
}

{
  config,
  pkgs,
  lib,
  ...
}: lib.mkIf config.fontPackages.enable {
  fonts.packages = (with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    aileron
  ]) ++ config.fontPackages.extraFonts
     ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}

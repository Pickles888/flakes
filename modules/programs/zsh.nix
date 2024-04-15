{ config, ... }:
let
  initScript = ''
    if [ $(tty) = /dev/tty1 ]; then
      exec Hyprland
    else
      fastfetch
    fi
  '';
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    promptInit = ''
      PS1="%{%F{blue}%}%{%K{blue}%}%{%F{black}%} %m%{%K{black}%}%{%F{blue}%} %/%{%F{black}%}%{%k%}
      %{%F{blue}%} 󰅷 %{%F{white}%}"
    '';
    interactiveShellInit = initScript;
    shellAliases = {
      rx = "sudo -E hx";
      rebuild = "sudo nixos-rebuild";
      c = "clear && fastfetch";
      ls = "eza --icons -F -H --group-directories-first --git -1";
      lsa = "eza --icons -F -H --group-directories-first --git -1 -T";
      nx = "sudo -E hx /etc/nixos";
      dev = "nix-shell";
    };
  };
}

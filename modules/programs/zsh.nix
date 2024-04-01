{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    promptInit = ''
PS1="%{%F{blue}%}%{%K{blue}%}%{%F{black}%} NixOS%{%K{black}%}%{%F{blue}%} %/%{%F{black}%}%{%k%} 
%{%F{blue}%} 󰅷 %{%F{white}%}"
    '';
    interactiveShellInit = "fastfetch";
    shellAliases = {
      vix-conf="sudo vim /etc/nixos/modules";
      vix-pack="sudo vim /etc/nixos/packages";
      vix-home="sudo vim /home/asynth/.config/home-manager/home.nix";
      rebuild="sudo nixos-rebuild";
      c="clear && fastfetch";
      exa="exa --icons -F -H --group-directories-first --git -1";
    };
  };
}

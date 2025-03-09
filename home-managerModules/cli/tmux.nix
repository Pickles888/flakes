{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nu";
    terminal = "kitty";
    shortcut = "Space";
    historyLimit = 100000;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'frappe'
          set -g @catppuccin_window_default_fill "number"
        '';
      }
    ];
    extraConfig = ''
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      set -as terminal-overrides ",kitty:Tc"
    '';
  };
}

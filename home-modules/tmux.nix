{config, pkgs, ...}:

{
   programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    newSession = true;
    prefix = "C-Space";
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    aggressiveResize = true;
    mouse = true;
    sensibleOnTop = true;
    plugins = [pkgs.tmuxPlugins.tokyo-night-tmux];
    extraConfig = ''
      set -g set-titles on
      set -g display-time 4000
      set -g status-interval 5
      set-option -g status-position top
      set -ag terminal-overrides ",$TERM:Tc"
      set -s extended-keys on
      set -as terminal-features 'xterm*:extkeys'
      set -g focus-events on
    '';
  };

}

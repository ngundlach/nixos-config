{config, pkgs, ...}:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      gtk-single-instance = true;
      shell-integration-features = "no-cursor,ssh-env";
      command = "${pkgs.zsh}/bin/zsh";
      theme = "TokyoNight";
      cursor-style-blink = false;
      mouse-hide-while-typing = true;
      quit-after-last-window-closed = false;
    };
  };
}

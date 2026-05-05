{config, pkgs, ...}:
{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      inline_height = 15;
      enter_accept = true;
    };
  };
}

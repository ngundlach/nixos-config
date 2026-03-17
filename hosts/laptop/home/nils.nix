{config, pkgs, ...}:
{
  home.username = "nils";
  home.homeDirectory = "/home/nils";
  home.stateVersion = "25.11";

  imports = [
    ../../../home-modules/nixvim.nix
    ../../../home-modules/tmux.nix
    ];

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      enter_accept = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    options = ["--cmd cd"];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      v = "nvim";
      ff = "fastfetch";
    };
    history.size = 10000;
  };
}

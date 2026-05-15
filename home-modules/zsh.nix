
{config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    autocd = true;
    dotDir = "${config.xdg.configHome}/zsh";
    shellAliases = {
      v = "nvim";
      ff = "fastfetch";
      pp = "prettyping";
      k = "kubectl";
      nb = "newsboat";
      open = "xdg-open";
    };
    siteFunctions = {
      take = ''
        mkdir -p "$1";
        cd "$1";
      '';
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      ignoreSpace = true;
      ignoreAllDups = true;
    };
    initContent = ''
      zstyle ':completion:*' menu select

      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word
    '';
  };
}

_: {
  programs.eza = {
    enable = true;
    git = true;
    enableZshIntegration = true;
    icons = "always";
    extraOptions = [
      "--group-directories-first"
    ];
  };
}

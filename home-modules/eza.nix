{config, pkgs, ...}:{
  programs.eza = {
    enable = true;
    git = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    icons = "always";
    extraOptions = [
      "--group-directories-first"
    ];
  };
}

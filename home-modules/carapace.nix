_: {
  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    environment.CARAPACE_MATCH = true;
  };
}

_: {
  programs.atuin = {
    enable = true;
    daemon.enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      auto_sync = false;
      search_mode = "daemon-fuzzy";
      inline_height = 15;
      enter_accept = true;
    };
  };
}

{pkgs, ...}: {
  programs.herdr = {
    enable = true;
    settings = {
      onboarding = false;
      ui = {
        show_agent_labels_on_pane_borders = true;
        toast.delivery = "herdr";
        sound.enabled = true;
        prompt_new_tab_name = false;
      };
      theme = {
        name = "tokyo-night";
        auto_switch = false;
      };
      terminal.default_shell = "${pkgs.zsh}/bin/zsh";
      keys.prefix = "ctrl+space";
    };
  };
}

{config, pkgs, ...}:

{
  programs.nixvim.plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      ai = {};
      icons = {};
      statusline = {};
      tabline = {};
    };
  };
}

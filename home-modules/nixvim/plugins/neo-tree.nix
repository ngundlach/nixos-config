{config, pkgs, ...}:

{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    settings = {
      filesystem = {
        filtered_items.hide_dotfiles = false;
      };
      window.width = 25;
    };
  };
}

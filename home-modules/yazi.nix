{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    plugins = {
      mount = pkgs.yaziPlugins.mount;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "M";
          run = "plugin mount";
          desc = "Mount drives";
        }
      ];
    };
  };
}

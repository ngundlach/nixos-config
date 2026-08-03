{config, ...}: {
  programs.nushell = {
    enable = true;
    shellAliases =
      config.home.shellAliases
      // {
        nu-open = "open"; # NOTE: remember alphabetical order due to alias chaining. n < o
        nu-take = "take";
      };
    settings = {
      show_banner = false;
    };
  };
}

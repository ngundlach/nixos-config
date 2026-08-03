{config, ...}: {
  config.home.shellAliases = {
    v = "nvim";
    ff = "fastfetch";
    pp = "prettyping";
    k = "kubectl";
    nb = "newsboat";
    open = "xdg-open";
    nhs = "nh os switch path:${config.home.homeDirectory}/nixos";
    nhu = "nh os switch path:${config.home.homeDirectory}/nixos --update";
    nhc = "nh clean all";
    oc = "opencode";
  };
}

{config, pkgs, ...}:
{
  programs.nixvim.lsp = {
    inlayHints.enable = true;
    servers = {
      nil_ls.enable = true;
      nil_ls.activate = true;
    };
  };
}

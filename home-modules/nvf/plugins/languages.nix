{...}:
{
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp.enable = true;
    treesitter.enable = true;
    debugger.nvim-dap.enable = true;
    lsp.enable = true;
    lsp.inlayHints.enable = true;
    lsp.servers.rust-analyzer = {
      settings = {
        "rust-analyzer" = {
          check = {
            command = "clippy";
            allFeatures = true;
          };
          procMacro = { enable = true; };
          inlayHints = {
            typeHints = { enable = true; };
            parameterHints = { enable = true; };
            chainingHints = { enable = true; };
          };
          completion = { autoimport = { enable = true; }; };
        };
      };
    };
    languages = {
      enableFormat = true;
      nix.enable = true;
      nix.lsp.enable = true;
      rust.enable = true;
      rust.lsp.enable = true;
      rust.treesitter.enable = true;
      rust.extensions.crates-nvim.enable = true;
    };
  };
}

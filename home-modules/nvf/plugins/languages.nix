{...}: {
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp.enable = true;
    treesitter.enable = true;
    debugger.nvim-dap.enable = true;
    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;

      servers.gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            };
          };
        };
      };

      servers.rust-analyzer = {
        settings = {
          "rust-analyzer" = {
            check = {
              command = "clippy";
              allFeatures = true;
            };
            procMacro.enable = true;
            inlayHints = {
              typeHints.enable = true;
              parameterHints.enable = true;
              chainingHints.enable = true;
            };
            completion.autoimport.enable = true;
          };
        };
      };
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      markdown.enable = true;
      tex.enable = true;
      yaml.enable = true;
      lua.enable = true;
      docker.enable = true;
      html.enable = true;
      typescript.enable = true;
      python.enable = true;
      clang.enable = true;
      bash.enable = true;
      nix.enable = true;
      go.enable = true;
      rust = {
        enable = true;
        extensions.crates-nvim.enable = true;
      };
    };
  };
}

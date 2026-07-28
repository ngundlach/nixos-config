{pkgs, ...}: {
  programs.nvf.settings.vim = {
    luaConfigRC.snacks-keymaps = ''
      local map = vim.keymap.set
      map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
      map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep" })
      map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
      map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help Tags" })
      map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent Files" })
      map("n", "<leader>fd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
      map("n", "<leader>fs", function() Snacks.picker.lsp_document_symbols() end, { desc = "Document Symbols" })
      map({"n", "x"}, "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })
    '';

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        indent = {
          enabled = true;
          animate.enabled = false;
        };
        picker = {
          enabled = true;
          ui_select = true;
          db = {
            sqlite3_path = "${pkgs.sqlite.out}/lib/libsqlite3.so";
          };
        };
        input.enabled = true;
      };
    };

    extraPackages = with pkgs; [
      mermaid-cli
      ghostscript
      imagemagick
      trash-cli
      ripgrep
      git
      fd
    ];
  };
}

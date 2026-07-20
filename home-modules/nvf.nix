{...}: {
  imports = [
    ./nvf/plugins/ui.nix
    ./nvf/plugins/languages.nix
    # ./nvf/plugins/oil-nvim.nix
    ./nvf/plugins/editor.nix
  ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        syntaxHighlighting = true;
        opts = {
          termguicolors = true;
          splitright = true;
          splitbelow = true;
          number = true;
          relativenumber = true;
          tabstop = 2;
          shiftwidth = 2;
          autoindent = true;
          shiftround = true;
          cursorline = true;
          ttyfast = true;
          showmatch = true;
          hlsearch = true;
          expandtab = true;
          wrap = false;
          list = true;
          listchars = {
            tab = "  ";
            trail = "-";
          };
        };
        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };
        keymaps = [
          {
            action = ":update<CR>";
            key = "<C-s>";
            mode = ["n"];
            silent = true;
            noremap = true;
          }
        ];
        theme = {
          enable = true;
          name = "tokyonight";
          style = "night";
        };
        git.enable = true;
      };
    };
  };
}

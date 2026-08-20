_: {
  programs.nvf.settings.vim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      {
        action = ":write<CR>";
        key = "<C-s>";
        mode = ["n"];
        silent = true;
        noremap = true;
      }
    ];
  };
}

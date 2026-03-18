{config, pkgs, ...}:
   
{
  imports = [
    ./nixvim/plugins/mini.nix
    ./nixvim/plugins/lualine.nix
    ./nixvim/plugins/telescope.nix
    ./nixvim/plugins/neo-tree.nix
    ./nixvim/plugins/lsp.nix
  ];

   programs.nixvim = {
    enable = true;
		defaultEditor = true;
		vimAlias = true;

 		viAlias = true; 

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
    };
    globals = {
			mapleader = " ";
			maplocalleader = " ";
		};
    colorschemes.tokyonight = {
      enable = true;
      autoLoad = true;
      settings.style = "night";
    };
  };
}

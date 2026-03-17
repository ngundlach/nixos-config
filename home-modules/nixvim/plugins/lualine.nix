{config, pkgs, ...}:
{
  programs.nixvim.pligins.lualine = {
    enable = false;
		settings = {
			options = {
		  	icons_enabled = true;
        globalstatus = true;
			};
		};
  };
}

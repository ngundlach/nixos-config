{
  programs.nvf.settings.vim = {
    mini.tabline = {
      enable = true;
    };

    mini.icons.enable = true;

    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        git_status_async = false;
        filesystem = {
          filtered_items = {
            visible = true;
          };
          use_libuv_file_watcher = true;
        };
        window.width = 25;
      };
    };

    statusline.lualine = {
      enable = true;
      setupOpts = {
        icons_enabled = true;
        globalstatus = true;
      };
    };

    keymaps = [
      {
        action = "<Cmd>Neotree toggle<CR>";
        key = "<leader>e";
        mode = [ "n" "v" "c" ];
        noremap = true;
      }
    ];

    dashboard.dashboard-nvim = {
      enable = true;
    };
  };
}


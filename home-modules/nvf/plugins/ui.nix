_: {
  programs.nvf.settings.vim = {
    mini = {
      ai.enable = true;
      tabline.enable = true;
      icons.enable = true;
    };

    notes.todo-comments.enable = true;

    binds.whichKey.enable = true;

    visuals.fidget-nvim.enable = true;

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
        mode = ["n" "v" "c"];
        noremap = true;
      }
    ];

    dashboard.dashboard-nvim = {
      enable = true;
    };
  };
}

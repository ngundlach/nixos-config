{...}:

{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    settings = {
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
}

_: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "top-center";
        offset = "(100, 0)";
      };
      urgency_low = {
        background = "#16161e";
        foreground = "#c0caf5";
        frame_color = "#c0caf5";
      };
      urgency_normal = {
        background = "#1a1b26";
        foreground = "#c0caf5";
        frame_color = "#c0caf5";
      };
      urgency_critical = {
        background = "#292e42";
        foreground = "#db4b4b";
        frame_color = "#db4b4b";
      };
      experimental = {
        pause_on_mouse_over = true;
      };
    };
  };
}

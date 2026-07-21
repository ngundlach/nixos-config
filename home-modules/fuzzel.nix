_: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icons-enabled = false;
        use-bold = true;
        dpi-aware = false;
        hide-before-typing = true;
        lines = 3;
        cache = "/dev/null";
      };
      colors = {
        background = "1e1e2eff";
        text = "cdd6f4ff";
        match = "f38ba8ff";
        selection = "585b70ff";
        selection-match = "f38ba8ff";
        selection-text = "cdd6f4ff";
        border = "b4befeff";
      };
      border.radius = 0;
    };
  };
}

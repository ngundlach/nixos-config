{config, pkgs, lib, ...}:
{
  home.username = "nils";
  home.homeDirectory = "/home/nils";
  home.stateVersion = "26.05";

  imports = [
    ../../../home-modules/nixvim.nix
    ../../../home-modules/themes.nix
    ../../../home-modules/tmux.nix
    ];

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      inline_height = 15;
      enter_accept = true;
    };
  };
  
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.gh = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    icons = "always";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      gtk-single-instance = true;
      shell-integration-features = "no-cursor";
      command = "${pkgs.zsh}/bin/zsh";
      theme = "TokyoNight";
      cursor-style-blink = false;
      mouse-hide-while-typing = true;
      quit-after-last-window-closed = false;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    options = ["--cmd cd"];
  };
  
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    plugins = {
      mount = pkgs.yaziPlugins.mount;
    };
    keymap = {
      mgr.prepend_keymap = [
        {on = "M"; run = "plugin mount"; desc = "Mount drives";}
      ];
    };

  };

  programs.starship = {
    enable = true;
    settings = {
      line_break.disabled = true;
      format = lib.concatStrings [
        "$all"
        "$character"
      ];
      character = {
       success_symbol = "[λ](bold green)"; 
       error_symbol = "[✗](bold red)";
      };
      directory = {
        format = lib.concatStrings [
          "\\[[$path]"
          "($style)"
          "[$read_only]"
          "($read_only_style)\\] "
        ];
      };
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icons-enabled = false;
        use-bold = true;
        dpi-aware = true;
        hide-before-typing = true;
        lines = 3;
        cache = "dev/null";
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    shellAliases = {
      ll = "ls -l";
      v = "nvim";
      ff = "fastfetch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
  };
}

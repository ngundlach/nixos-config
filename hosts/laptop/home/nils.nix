{lib, ...}: {
  home = {
    username = "nils";
    homeDirectory = "/home/nils";
    stateVersion = "26.05";
  };

  imports = let
    optional = base: file: let
      path = base + "/${file}";
    in
      lib.optional (builtins.pathExists path) path;
    sharedModulesPath = ../../../home-modules;
    sharedModules = map (optional sharedModulesPath) [
      "nvf.nix"
      "themes.nix"
      "tmux.nix"
      "mpv.nix"
      "zsh.nix"
      "fuzzel.nix"
      "yazi.nix"
      "zoxide.nix"
      "atuin.nix"
      "ghostty.nix"
      "eza.nix"
      "starship.nix"
      "fastfetch.nix"
      "mime-apps.nix"
      "alacritty.nix"
      "github.nix"
      "newsboat.nix"
      "carapace.nix"
      "dunst.nix"
      "gsettings.nix"
    ];
    hostModules = map (optional ./.) [
      "ssh.nix"
    ];
  in
    lib.concatLists (sharedModules ++ hostModules);

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof swaylock || swaylock -e -i ~/Pictures/locked.png -c 000000";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'";
          on-resume = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
        }
        {
          timeout = 350;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 3600;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "/home/nils/Pictures/jasa_scaled.jpg"
      ];
      wallpaper = [
        {
          monitor = "";
          path = "/home/nils/Pictures/jasa_scaled.jpg";
          fit_mode = "contain";
        }
      ];
    };
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
    nushell.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
      historyWidget.command = "";
    };
  };
}

{config, pkgs, lib, ...}:
{
  home.username = "nils";
  home.homeDirectory = "/home/nils";
  home.stateVersion = "26.05";

  imports = let 
      p = ../../../home-modules;
      mk = file: p + "/${file}";
      optional = path: lib.optional (builtins.pathExists (mk path)) (mk path);
      modules = [
        "nixvim.nix"
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
      ];
  in
    lib.concatLists (map optional modules);


  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof swaylock || swaylock -c 000000";
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
        "/home/nils/Pictures/wp12329532-nixos-wallpapers.png"
      ];
      wallpaper = [
        {
          monitor = "";
          path = "/home/nils/Pictures/wp12329532-nixos-wallpapers.png";
          fit_mode = "contain";
        }
      ];
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

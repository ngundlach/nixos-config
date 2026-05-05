{config, pkgs, lib, ...}:
{
  home.username = "nils";
  home.homeDirectory = "/home/nils";
  home.stateVersion = "26.05";

  imports = let 
      optional = path: lib.optional (builtins.pathExists path) path;
      p = ../../../home-modules;
  in [
      (p + "/nixvim.nix")
      (p + "/themes.nix")
      (p + "/tmux.nix")
      (p + "/mpv.nix")
      (p + "/zsh.nix")
      (p + "/fuzzel.nix")
      (p + "/yazi.nix")
      (p + "/zoxide.nix")
      (p + "/atuin.nix")
      (p + "/ghostty.nix")
      (p + "/eza.nix")
      (p + "/starship.nix")
    ] ++ optional (p +"/git.nix");

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "/home/nils/Pictures/train.jpg"
      ];
      wallpaper = [
        {
          monitor = "";
          path = "/home/nils/Pictures/train.jpg";
        }
      ];
    };
  };

  programs.gh = {
    enable = true;
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

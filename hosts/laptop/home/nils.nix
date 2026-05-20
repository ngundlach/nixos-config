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

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

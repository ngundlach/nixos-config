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
      "nushell.nix"
      "fuzzel.nix"
      "yazi.nix"
      "zoxide.nix"
      "atuin.nix"
      "ghostty.nix"
      "eza.nix"
      "starship.nix"
      "fastfetch.nix"
      "herdr.nix"
      "mime-apps.nix"
      "alacritty.nix"
      "github.nix"
      "newsboat.nix"
      "carapace.nix"
      "dunst.nix"
      "gsettings.nix"
      "shell-aliases.nix"
    ];
    hostModules = map (optional ./.) [
      "ssh.nix"
      "hypr.nix"
    ];
  in
    lib.concatLists (sharedModules ++ hostModules);

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      historyWidget.command = "";
    };
  };
}

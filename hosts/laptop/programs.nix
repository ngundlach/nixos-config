{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    p7zip
    nemo
    nemo-fileroller
    nemo-preview
    nemo-emblems
    folder-color-switcher
    atuin
    wget
    curl
    ghostty
    fastfetch
    nushell
    stow
    curlie
    pavucontrol
    waybar
    go
    golangci-lint
    rustup
    clang
    llvm
    rust-bindgen
    git
    brave
    discord
    element-desktop
    ffmpeg-full
    yt-dlp
    mpv
    bun
    newsboat
    vscode-fhs
    seahorse
    keepassxc
    podman-compose
    lazydocker
    killall
    ripgrep
    fd
    fuzzel
    alacritty
    zed-editor-fhs
    jq
    jqp
    jql
    dust
    dig
    nmap
    htop
    zathura
    zathuraPkgs.zathura_core
    zathuraPkgs.zathura_pdf_poppler
    imv
    slurp
    grim
    podman-desktop
  ];

  fonts.packages = [pkgs.nerd-fonts.geist-mono];
  programs.thunderbird.enable = true;
  virtualisation.podman = {
    enable = true;
  };
  
  programs.niri = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
  };

  programs.nh = {
    enable = true;
    flake = "/home/nils/nixos";
  };

  programs.firefox.enable = true;

  programs.hyprland = {
    enable = true;
  };

  programs.lazygit.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # programs.neovim = {
  #     enable = true;
  #     defaultEditor = true;
  #     viAlias = true;
  #     vimAlias = true;
  #     configure = {
  #       customRC = ''
  #       set number relativenumber
  #       set showmatch
  #       set hlsearch
  #       set tabstop=2
  #       set shiftwidth=2
  #       set expandtab
  #       syntax on
  #       set cursorline
  #       set ttyfast
  #       set list
  #       '';
  #     };
  # };
}

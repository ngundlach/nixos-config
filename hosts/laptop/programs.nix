{config, pkgs, ...}:
let
  cli = with pkgs; [
    carapace
    ncdu
    bat
    moor
    tealdeer
    iotop
    prettyping
    powertop
    yt-dlp
    termdown
    brightnessctl
    playerctl
    bluetui
    impala
    atuin
    wget
    curl
    fastfetch
    stow
    curlie
    killall
    ripgrep
    fd
    jq
    jqp
    jql
    dust
    dig
    nmap
    htop
    newsboat
    lazydocker
  ];

  dev = with pkgs; [
    kubectl
    kubernetes-helm
    jdk25
    flutter
    dotnet-sdk_10
    python3
    go
    golangci-lint
    clang
    llvm
    git
    gh
    bun
    vscode-fhs
    podman-compose
    zed-editor-fhs
    podman-desktop
    jetbrains.rust-rover
    jetbrains.rider
    jetbrains.idea
  ];

  gui = with pkgs; [
    drawy
    gimp-with-plugins
    ghostty
    mpv
    fuzzel
    alacritty
    libreoffice-fresh
    heroic
    chromium
    signal-desktop
    qalculate-gtk
    kdePackages.dolphin
    kdePackages.kpat
    spotify
    nemo-with-extensions
    nemo-seahorse
    nemo-fileroller
    nemo-preview
    nemo-emblems
    discord
    element-desktop
    brave
    seahorse
    keepassxc
    zathura
    zathuraPkgs.zathura_core
    zathuraPkgs.zathura_pdf_poppler
    imv
    bruno
    pavucontrol
  ];
in
{

  environment.systemPackages = with pkgs; [
    libsecret
    libva
    intel-gpu-tools
    xwayland-satellite
    libnotify
    hyprpaper
    bibata-cursors
    swaylock
    pulseaudio
    ntfs3g
    p7zip
    gvfs
    folder-color-switcher
    nushell
    waybar
    ffmpeg-full
    slurp
    grim
    wev
  ] ++ cli
    ++ dev
    ++ gui;

  programs.nix-ld.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.geist-mono
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };

  programs.virt-manager.enable = true;

  programs.steam = {
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


  programs.thunderbird.enable = true;

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

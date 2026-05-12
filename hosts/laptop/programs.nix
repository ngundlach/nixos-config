{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    libsecret
    tealdeer
    python3
    moor
    bruno
    bat
    gh
    prettyping
    libva
    intel-gpu-tools
    ncdu
    mesa-demos
    chromium
    flutter
    xwayland-satellite
    qalculate-gtk
    powertop
    signal-desktop
    jdk25
    yt-dlp
    termdown
    libnotify
    kdePackages.dolphin
    kdePackages.kpat
    hyprpaper
    bibata-cursors
    jetbrains-toolbox
    brightnessctl
    playerctl
    swaylock
    pulseaudio
    bluetui
    impala
    ntfs3g
    spotify
    p7zip
    nemo-with-extensions
    nemo-seahorse
    nemo-fileroller
    nemo-preview
    nemo-emblems
    gvfs
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
    clang
    llvm
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
    wev
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.geist-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  programs.thunderbird.enable = true;

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

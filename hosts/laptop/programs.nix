{pkgs, ...}: let
  cli = with pkgs; [
    zenith
    fzf
    pi-coding-agent
    opencode
    herdr
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
    translate-shell
    poppler-utils
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
    jetbrains.clion
    android-studio
    texliveBasic
    luaPackages.tree-sitter-cli
  ];

  gui = with pkgs; [
    eloquent
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
in {
  environment.systemPackages = with pkgs;
    [
      e2fsprogs
      libsecret
      libva
      intel-gpu-tools
      mesa-demos
      xwayland-satellite
      libnotify
      hyprpaper
      bibata-cursors
      swaylock
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
      wl-clipboard
    ]
    ++ cli
    ++ dev
    ++ gui;

  programs = {
    virt-manager.enable = true;
    steam.enable = true;
    hyprland.enable = true;
    niri.enable = true;
    zsh.enable = true;
    nh = {
      enable = true;
      flake = "/home/nils/nixos";
    };
    thunderbird.enable = true;
    firefox.enable = true;
    lazygit.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    localsend = {
      enable = true;
      openFirewall = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        libX11
        libXcomposite
        libXdamage
        libXext
        libXfixes
        libXi
        libXtst
        libxcb
        libXrender
        libxkbfile
        libpulseaudio
        libbsd
        wayland
        libpng
        nss
        nspr
        expat
        mesa
        glib
        glibc
        zlib
        libdrm
      ];
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.geist-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    roboto
    roboto-flex
    roboto-slab
    roboto-serif
    roboto-mono
  ];

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };
}

{config, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "bellatrix";

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";
  i18n.extraLocaleSettings = {
    LC_CTYPE = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
    LC_COLLATE = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_ADDRESS = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
  };
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services.xserver.xkb.layout = "eu";
  services.xserver.xkb.options = "caps:escape";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.nils = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
      packages = with pkgs; [
    ];
  };

  environment.systemPackages = with pkgs; [
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
    rustup
    git
    brave
    discord
    element-desktop
    ffmpeg_7-full
    yt-dlp
    mpv
    bun
    newsboat
    vscode-fhs
    seahorse
    keepassxc
    podman-compose
    podman-desktop
    killall
    ripgrep
    fzf
    fd
  ];

  virtualisation.podman.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/nils/nixos";
  };
  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
  };
  programs.starship.enable = true;
  programs.lazygit.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.yazi = {
    enable = true;

  };
  programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      configure = {
        customRC = ''
        set number relativenumber
        set showmatch
        set hlsearch
        set tabstop=2
        set shiftwidth=2
        set expandtab
        syntax on
        set cursorline
        set ttyfast
        set list
        '';
      };
  };

  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.displayManager.ly.enable = true;
  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}

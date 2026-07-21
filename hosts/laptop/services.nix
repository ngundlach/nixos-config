_: {
  services = {
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
    displayManager.ly.enable = true;
    xserver.xkb = {
      layout = "eu";
      options = "caps:escape";
    };

    udisks2.enable = true;

    tlp.enable = true;

    logind.settings.Login = {
      HandleLidSwitch = "sleep";
      HandleLidSwitchExternalPower = "lock";
      HandleLidSwitchDocked = "ignore";
    };

    dunst.enable = true;

    hypridle.enable = true;

    fwupd.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber = {
        enable = true;
      };
    };

    libinput.enable = true;
  };

  security.pam.services.ly = {
    enableGnomeKeyring = true;
  };
}

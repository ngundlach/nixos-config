{config, pkgs, ...}:
{
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.displayManager.ly.enable = true;
  security.pam.services.ly = {
    enableGnomeKeyring = true;
  };
  services.xserver.xkb = {
    layout = "eu";
    options = "caps:escape";
  };

  services.udisks2.enable = true;

  services.tlp.enable = true;

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "ignore";
  };

  services.dunst = {
    enable = true;
  };

  services.hypridle = {
    enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber = {
      enable = true;
    };
  };

  services.libinput.enable = true;
}

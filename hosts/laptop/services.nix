{config, pkgs, ...}:
{
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.displayManager.ly.enable = true;
  services.xserver.xkb = {
    layout = "eu";
    options = "caps:escape";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;
}

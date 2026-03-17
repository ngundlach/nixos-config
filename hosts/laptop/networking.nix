{config, pkgs, ...}:
{
  networking.hostName = "bellatrix";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
  };
}

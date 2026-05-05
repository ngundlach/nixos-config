{config, pkgs, ...}:
{
  networking.hostName = "maia";
  networking.networkmanager = {
    enable = false;
  };
  networking.wireless = {
    iwd = {
      enable = true;
      settings = {
        General = {
          EnableNetworkConfiguration = true;
        };
      };
    };
  };

  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = false;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}

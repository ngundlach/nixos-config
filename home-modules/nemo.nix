{pkgs, ...}: {
  dconf.settings = {
    "org/cinnamon/desktop/applications/terminal" = {
      exec = "${pkgs.foot}/bin/footclient";
    };
    "org/nemo/preferences/menu-config" = {
      background-menu-open-as-root = false;
      selection-menu-open-as-root = false;
    };
  };
}

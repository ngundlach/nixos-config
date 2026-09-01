{pkgs, ...}: {
  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "catppuccin-mocha-blue-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = ["blue"];
        size = "standard";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  qt = {
    enable = true;
    style.name = "kvantum";
    kvantum = {
      enable = true;
      themes = [
        (pkgs.catppuccin-kvantum.override {
          variant = "mocha";
          accent = "blue";
        })
      ];
      settings.General.theme = "catppuccin-mocha-blue";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-blink = false;
      cursor-size = 24;
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Original-Ice";
    package = pkgs.bibata-cursors;
  };
}

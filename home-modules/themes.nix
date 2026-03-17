{config, pkgs, ...}:
{
  gtk = {
    enable = true;
    theme = {
      name = "Matcha-dark-azul";
      package = pkgs.matcha-gtk-theme;
    };
    iconTheme = {
      name = "Breeze Dark";
      package = pkgs.kdePackages.breeze-icons;
    };
  };
}

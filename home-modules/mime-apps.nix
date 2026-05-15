
{config, pkgs, ...}:
{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "image/jpg" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/pjpeg" = [ "imv.desktop" ];
      "image/png" = [ "imv.desktop" ];
      "image/x-png" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
      "image/bmp" = [ "imv.desktop" ];
      "image/heif" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/svg" = [ "imv.desktop" ];
    };
    defaultApplications = {
      "image/jpg" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/pjpeg" = [ "imv.desktop" ];
      "image/png" = [ "imv.desktop" ];
      "image/x-png" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
      "image/bmp" = [ "imv.desktop" ];
      "image/heif" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/svg" = [ "imv.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
    };
  };
}

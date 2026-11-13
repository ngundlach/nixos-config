_: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/jpg" = ["imv.desktop"];
      "image/jpeg" = ["imv.desktop"];
      "image/pjpeg" = ["imv.desktop"];
      "image/png" = ["imv.desktop"];
      "image/x-png" = ["imv.desktop"];
      "image/gif" = ["imv.desktop"];
      "image/bmp" = ["imv.desktop"];
      "image/heif" = ["imv.desktop"];
      "image/webp" = ["imv.desktop"];
      "image/svg+xml" = ["imv.desktop"];

      "inode/directory" = ["nemo.desktop"];
      "application/pdf" = ["org.pwmt.zathura-pdf-poppler.desktop"];

      "text/html" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "application/vnd.mozilla.xul+xml" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
    };
  };
}

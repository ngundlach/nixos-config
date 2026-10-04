{pkgs, ...}: {
  home.sessionVariables = {
    PAGER = "moor";
    CHROME_EXECUTABLE = "${pkgs.chromium}/bin/chromium"; # chrome executable for flutter
  };
}

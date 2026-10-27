{
  pkgs,
  config,
  ...
}: {
  home.sessionVariables = {
    PAGER = "moor";
    CHROME_EXECUTABLE = "${pkgs.chromium}/bin/chromium"; # chrome executable for flutter
  };
  home.sessionPath = ["${config.home.homeDirectory}/applications/ninbin"];
}

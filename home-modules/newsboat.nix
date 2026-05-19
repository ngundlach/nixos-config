

{config, pkgs, ...}:
{
  programs.newsboat = {
    enable = true;
    extraConfig = "
      urls-source \"freshrss\"
      freshrss-url `secret-tool lookup freshrss url`
      freshrss-login `secret-tool lookup freshrss user`
      freshrss-passwordeval \"secret-tool lookup freshrss pw\"
      macro v set browser \"mpv %u --profile=1080p --geometry=1280x720 &\"; open-in-browser-noninteractively;
    ";
  };
}

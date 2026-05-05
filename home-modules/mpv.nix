
{config, pkgs, ...}:
{
  programs.mpv = {
    enable = true;
    profiles = {
      "1080p" = {
        force-window = true;
        ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
        loop-file = false;
      };
    };
    config = {
      loop-file = true;
    };
  };
}

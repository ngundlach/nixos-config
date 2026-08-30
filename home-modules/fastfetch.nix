{config, ...}: let
  sinz = ''
    ${config.home.homeDirectory}/applications/ninbin/sinz $(stat -c %W /) --output-fmt=string --format="{months}, {days} - ({whole_days})"
  '';
in {
  programs.fastfetch = {
    enable = true;
    settings = {
      display.separator = "";
      logo = {
        type = "sixel";
        source = "${config.home.homeDirectory}/nixos/assets/images/nixos.png";
        height = 15;
      };
      modules = [
        {
          type = "custom";
          format = "{#90}┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "host";
          key = " ┌󰌢  ";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = " ├  ";
          keyColor = "green";
          format = "{name} @ {freq-max}";
        }
        {
          type = "gpu";
          key = " ├󰾲  ";
          keyColor = "green";
        }
        {
          type = "display";
          key = " ├󰍹  ";
          keyColor = "green";
        }
        {
          type = "memory";
          key = " ├󰑭  ";
          keyColor = "green";
        }
        {
          type = "disk";
          key = " ├󰋊  ";
          keyColor = "green";
        }
        {
          type = "battery";
          key = " └󰂄  ";
          keyColor = "green";
        }
        {
          type = "custom";
          format = "{#90}└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "{#90}┌──────────────────────System────────────────────────┐";
        }
        {
          type = "title";
          key = " ┌  ";
          keyColor = "cyan";
          format = "{user-name}@{host-name}";
        }
        {
          type = "os";
          key = " ├  ";
          keyColor = "cyan";
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "cyan";
        }
        {
          type = "packages";
          key = " └󰏗  ";
          keyColor = "cyan";
        }
        "break"
        {
          type = "wm";
          key = " ┌󱂬  ";
          keyColor = "blue";
        }
        {
          type = "de";
          key = " ├󰨇  ";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = " ├󰆍  ";
          keyColor = "blue";
        }
        {
          type = "terminalfont";
          key = " ├  ";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = " └󰞷  ";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "{#90}└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "{#90}┌────────────────────Uptime / Age────────────────────┐";
        }
        {
          type = "command";
          key = " ┌  ";
          keyColor = "magenta";
          text = "${sinz}";
        }
        {
          type = "uptime";
          key = " └  ";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = "{#90}└────────────────────────────────────────────────────┘";
        }
      ];
    };
  };
}

_: {
  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof swaylock || swaylock -e -i ~/Pictures/locked.png -c 000000";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
        };
        listener = [
          {
            timeout = 300;
            on-timeout = "hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'";
            on-resume = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
          }
          {
            timeout = 350;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 3600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };

    hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = [
          "/home/nils/Pictures/jasa_scaled.jpg"
        ];
        wallpaper = [
          {
            monitor = "";
            path = "/home/nils/Pictures/jasa_scaled.jpg";
            fit_mode = "contain";
          }
        ];
      };
    };

    hyprsunset = {
      enable = true;
      settings = {
        profile = [
          {
            time = "08:00";
            identity = true;
          }
          {
            time = "20:00";
            temperature = 5000;
          }
        ];
      };
    };
  };
}

{
  pkgs,
  config,
  ...
}:
let 
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
in 
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --remember --remember-session --time --cmd niri-session";
        user = "aria";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/

  systemd = {
    # To prevent getting stuck at shutdown
    settings = {
      Manager = {
        DefaultTimeoutStopSec = "10s";
      };
    };
    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}

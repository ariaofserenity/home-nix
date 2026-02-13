{
  pkgs,
  ...
}:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      prefer-no-csd = true;
      hotkey-overlay = {
        skip-at-startup = true;
      };
      layout = {
        gaps = 12;
      };
      input = {
        keyboard.xkb.layout = "us";
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = false;
      };
      outputs = {
        "DP-3" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 144.000;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
        "HDMI-A-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.000;
          };
          scale = 1.0;
          position = {
            x = 2560;
            y = 0;
          };
        };
        "DP-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.000;
          };
          scale = 1.0;
          position = {
            x = 1000;
            y = -1080;
          };
        };
      };
      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";
        DISPLAY = ":0";
      };
    };
  };
}

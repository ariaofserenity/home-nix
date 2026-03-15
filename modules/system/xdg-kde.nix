{
  pkgs,
  ...
}:
{
  xdg.autostart.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = "kde";
        "org.freedesktop.impl.portal.Screenshot" = "kde";
        "org.freedesktop.impl.portal.RemoteDesktop" = "kde";
      };
      niri = {
        default = [
          "niri"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.OpenURI" = [
          "gtk"
          "gnome"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = "kde";
        "org.freedesktop.impl.portal.Screenshot" = "kde";
        "org.freedesktop.impl.portal.RemoteDesktop" = "kde";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    adw-gtk3
  ];

  programs.dconf.enable = true;
}
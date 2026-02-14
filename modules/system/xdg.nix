{
  pkgs,
  ...
}:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [ "gtk" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    adw-gtk3
  ];

  programs.dconf.enable = true;
}

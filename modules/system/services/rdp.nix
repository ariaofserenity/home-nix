{ pkgs, ... }:
{
  services.xrdp = {
    enable = true;
    defaultWindowManager = "${pkgs.niri}/bin/niri-session";
    openFirewall = true;
  };

  services.displayManager.sessionPackages = [ pkgs.niri ];
}
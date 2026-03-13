{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    krdp
  ];

  services.xrdp.enable = true;

  networking.firewall.allowedTCPPorts = [ 5900 ];
}

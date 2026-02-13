{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wayvnc
  ];
  
  networking.firewall.allowedTCPPorts = [ 5900 ];
  
  systemd.user.services.wayvnc = {
    description = "wayvnc VNC server";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.wayvnc}/bin/wayvnc 0.0.0.0 5900";
      Restart = "on-failure";
    };
  };
}
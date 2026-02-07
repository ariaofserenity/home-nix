{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    discord
  ];

  services.arrpc = {
    enable = true;
    package = pkgs.arrpc;
    systemdTarget = "graphical-session.target";
  };
}

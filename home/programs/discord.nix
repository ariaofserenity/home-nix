{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
  ];

  services.arrpc = {
    enable = true;
    package = pkgs.arrpc;
    systemdTarget = "graphical-session.target";
  };
}

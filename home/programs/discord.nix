{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    discord.krisp.enable = true;
  };

  services.arrpc = {
    enable = true;
    package = pkgs.arrpc;
    systemdTarget = "graphical-session.target";
  };
}

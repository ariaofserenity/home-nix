{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "elaria";
  home.homeDirectory = "/home/elaria";
  home.packages = with pkgs; [
    firefox
    vim
  ];

  imports = [
    ../programs/niri

    ../programs/discord.nix
  ];
}

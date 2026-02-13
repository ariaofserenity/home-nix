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
    vim
    unzip
    rar
    mpv
    dysk
    xwayland-satellite
    tree

    #apps
    firefox
    lutris
    prismlauncher
    file-roller
    thunar
    qbittorrent
    obsidian
  ];

  imports = [
    ../programs/niri

    ../programs/discord.nix
  ];

  home.stateVersion = "25.11";
}

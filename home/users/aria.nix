{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "aria";
  home.homeDirectory = "/home/aria";
  home.packages = with pkgs; [
    vim
    unzip
    rar
    mpv
    dysk
    xwayland-satellite
    tree
    swaylock
    dysk

    #apps
    firefox
    lutris
    prismlauncher
    file-roller
    thunar
    qbittorrent
    obsidian
    fuzzel
    antimicrox

    #games
    #xivlauncher-rb
  ];

  imports = [
    ../programs/niri
    ../programs/browsers
    ../programs/editors

    ../programs/games/hsr.nix
    ../programs/terminals/alacritty.nix
    ../programs/discord.nix
  ];
}

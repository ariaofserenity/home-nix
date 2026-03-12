{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "elaria";
  home.homeDirectory = "/home/elaria";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    vim
    unzip
    rar
    mpv
    dysk
    xwayland-satellite
    tree
    dysk
    fastfetch
    jq
    thunar
    thunar-volman
    thunar-archive-plugin

    #apps
    firefox
    lutris
    prismlauncher
    file-roller
    thunar
    qbittorrent
    obsidian

    # games
    xivlauncher-rb
  ];

  imports = [
    ../programs/browsers
    ../programs/discord.nix
    ../programs/terminals/ghostty.nix
  ];
}

{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "aria";
  home.homeDirectory = "/home/aria";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    XCURSOR_SIZE = 12;
  };


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
    keymapp

    #games
    xivlauncher-rb
  ];

  xdg.configFile."gtk-4.0/gtk.css".force = true;
  xdg.configFile."gtk-3.0/settings.ini".force = true;

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-size = 8;
    };
  };

  imports = [
    ../programs/niri
    ../programs/browsers
    ../programs/editors

    ../programs/terminals/alacritty.nix
    ../programs/terminals/ghostty.nix
    ../programs/discord.nix
    ../programs/shell/zsh.nix
  ];
}

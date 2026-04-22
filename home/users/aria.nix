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
    fastfetch
    pywal
    pywalfox-native
    quickshell
    jq
    thunar
    thunar-volman
    thunar-archive-plugin
    freerdp
    lshw
#apps
    firefox
    lutris
    prismlauncher
    vesktop
    file-roller
    qbittorrent
    obsidian
    fuzzel
    antimicrox
    keymapp
    gimp
    davinci-resolve
    azahar
    remmina
    tigervnc
    rustdesk-flutter
    calibre
    docker-compose
    zip
    moonlight-qt
    qemu
    quickemu
    eden
    imagemagick
    binutils
    #games
    (pkgs.callPackage "${inputs.nixos-xivlauncher-rb}/xivlauncher-rb/default.nix" {
      dotnetCorePackages = pkgs.dotnetCorePackages // {
        dotnet_10 = pkgs.dotnetCorePackages.dotnet_10 // {
          sdk = pkgs.dotnetCorePackages.combinePackages [
            pkgs.dotnetCorePackages.dotnet_9.sdk
            pkgs.dotnetCorePackages.dotnet_10.sdk
          ];
        };
      };
    })
];

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-size = 12;
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
    ../programs/ghidra.nix
  ];
}

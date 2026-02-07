{
  pkgs,
  inputs,
  config,
  ...
}:

let
  HostPackages = import ./packages.nix { inherit pkgs inputs; };
in
{
  home.username = "aria";
  home.homeDirectory = "/home/aria";

  imports = [
    ../../home/niri
    ../../home/programs/browsers
    ../../home/programs/editors

    ../../home/programs/terminal/nushell.nix
    ../../home/programs/terminal/zoxide.nix
    ../../home/programs/discord.nix
    ../../home/programs/fastfetch.nix
    ../../home/programs/ghostty.nix
    ../../home/programs/mangohud.nix

    ../../system/shell/zsh.nix

  ];

  home.packages = HostPackages;

  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "hx";
    NH_FLAKE = "/home/${config.home.username}/nixos";
  };

  # Clipboard Manager
  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs.home-manager.enable = true;
}
{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    # base system
    ../../../modules/system/pipewire.nix
    ../../../modules/system/packages.nix
    ../../../modules/system/environment.nix
    ../../../modules/system/xdg.nix
    ../../../modules/system/kde.nix

    # system programs
    ../../../modules/system/programs/obs.nix
    ../../../modules/system/programs/steam.nix

    # system services
    ../../../modules/system/services/flatpak.nix
    ../../../modules/system/services/keyring.nix
    ../../../modules/system/services/ssh.nix
    ../../../modules/system/services/rdp.nix
    inputs.home-manager.nixosModules.default
  ];

  networking = {
    hostName = "yume";
    networkmanager.enable = true;
    nameservers = [
      "192.168.2.5"
      "1.1.1.1"
    ];
  };

  networking.firewall.allowedTCPPorts = [ 3389 ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "elaria" = import ../../../home/users/elaria.nix;
    };
  };

  programs.zsh.enable = true;
  programs.xfconf.enable = true; # allow thunar to save preferences
  services.gvfs.enable = true; # allow thunar to show mount/trash
  services.tumbler.enable = true; # thumbnail support for images

  users.users = {
    aria = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
        "networkmanager"
        "docker"
      ];
    };
    elaria = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
        "networkmanager"
        "docker"
      ];
    };
  };

  fonts.packages = with pkgs; [
    fira-sans
    roboto
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    material-symbols
    material-icons
  ];

  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [ bluez ];

  services.printing.enable = true;

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
  };

  hardware.nvidia.prime = {
    intelBusId = "PCI:0@0:2:0";
    nvidiaBusId = "PCI:1@0:0:0";
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  system.stateVersion = "25.11";
}

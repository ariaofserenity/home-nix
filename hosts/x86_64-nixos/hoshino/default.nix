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
    ../../../modules/system/greetd.nix

    # system programs
    ../../../modules/system/programs/obs.nix
    ../../../modules/system/programs/steam.nix

    # system services
    ../../../modules/system/services/flatpak.nix
    ../../../modules/system/services/keyring.nix
    ../../../modules/system/services/ssh.nix
    inputs.home-manager.nixosModules.default

    # games
    ../../../modules/system/games/hsr.nix
  ];

  networking = {
    hostName = "hoshino";
    interfaces = {
      eno1.ipv4.addresses = [
        {
          address = "192.168.2.10";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.2.1";
    };
    nameservers = [
      "192.168.2.5"
      "1.1.1.1"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "aria" = import ../../../home/users/aria.nix;
    };
  };

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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  system.stateVersion = "25.11";
}

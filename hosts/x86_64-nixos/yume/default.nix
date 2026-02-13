{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [

    # base system
    "../../../modules/system/pipewire.nix"
    "../../../modules/system/packages.nix"
    "../../../modules/system/environment.nix"
    "../../../modules/system/shell/zsh.nix"
    "../../../modules/system/xdg.nix"
    "../../../modules/system/greetd.nix"

    # system programs
    "../../../modules/system/programs/obs.nix"
    "../../../modules/system/programs/steam.nix"

    # system services
    "../../../modules/system/services/flatpak.nix"
    "../../../modules/system/services/keyring.nix"
    "../../../modules/system/services/ssh.nix"
    inputs.home-manager.nixosModules.default
  ];

  networking = {
    hostName = "yume";
    interfaces = {
      ens18.ipv4.addresses = [
        {
          address = "192.168.2.3";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.2.1";
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "aria" = import ../../../home/users/aria.nix;
      "elaria" = import ../../../home/users/elaria.nix;
    };
  };

  users.users = {
    aria = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
      ];
    };
    elaria = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
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

  dbus.enable = true;
  dbus.packages = with pkgs; [ bluez ];

  printing.enable = true;

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };


  system.stateVersion = "25.05";
}

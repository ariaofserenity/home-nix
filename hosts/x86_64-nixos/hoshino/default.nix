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
    ./mounts.nix
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
    ../../../modules/system/services/syncthing.nix
    inputs.home-manager.nixosModules.default

    # games
    ../../../modules/system/games/hsr.nix

    # patches
    ../../../modules/system/krisp_patcher.nix
  ];

  networking = {
    hostName = "hoshino";

    bridges = {
      br0 = {
        interfaces = [ "eno1" ];
      };
    };

    interfaces = {
      eno1 = { };
      br0.ipv4.addresses = [
        {
          address = "192.168.2.10";
          prefixLength = 24;
        }
      ];
    };

    defaultGateway = {
      address = "192.168.2.1";
      interface = "br0";
    };

    nameservers = [
      #"192.168.2.5"
      "1.1.1.1"
    ];
  };

  environment.etc."qemu/bridge.conf".text = ''
    allow br0
  '';

  security.wrappers.qemu-bridge-helper = {
    setuid = true;
    owner = "root";
    group = "root";
    source = "${pkgs.qemu}/libexec/qemu-bridge-helper";
  };

  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "aria" = import ../../../home/users/aria.nix;
    };
  };

  networking.firewall.allowedTCPPorts = [
    7700
    25565
    7777
    7778
  ];

  networking.firewall.allowedUDPPorts = [
    7777
    7778
  ];

  programs.zsh.enable = true;
  programs.xfconf.enable = true; # allow thunar to save preferences
  services.gvfs.enable = true; # allow thunar to show mount/trash
  services.tumbler.enable = true; # thumbnail support for images

  users.users = {
    aria = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "input"
        "networkmanager"
        "docker"
        "plugdev"
      ];
    };
  };

  fonts.packages =
    with pkgs;
    [
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
      terminus_font
    ]
    ++ (with inputs.nixos-fonts.packages.x86_64-linux; [
      azukifont
    ]);

  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [ bluez ];

  i18n.extraLocales = [ "ja_JP.UTF-8/UTF-8" ];

  services.printing.enable = true;

  hardware = {
    uinput.enable = true;
    opentabletdriver.enable = true;
    amdgpu.opencl.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
  };

  boot = {
    kernelModules = [ "uinput" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  nix.settings = {
    download-buffer-size = 524288000;
  };

  # zsa voyager udev for flashing
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", MODE:="0666", SYMLINK+="ignition_dfu"
    KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", MODE="0664", GROUP="plugdev"
    KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", GROUP="plugdev"
  '';

  system.stateVersion = "25.11";
}

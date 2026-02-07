{
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    "../../../modules/system/pipewire.nix"
    "../../../modules/system/packages.nix"
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
}

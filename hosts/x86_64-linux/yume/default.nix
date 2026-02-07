{
  lib,
  config,
  pkgs,
  ...
}:

let
  hostUsers = import ../../home/hosts/${config.networking.hostName}.nix;
  mkUser = import ../../home/lib/mkUser.nix { inherit pkgs lib; };
in
{

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

  home-manager.users = lib.mapAttrs (
    user: cfg:
    mkUser {
      inherit user;
      roles = cfg.roles;
      extraPackages = cfg.extraPackages;
    }
  ) hostUsers;

  users.users = lib.mapAttrs (name: cfg: {
    isNormalUser = true;
    extraGroups = cfg.groups;
  }) hostUsers;
}

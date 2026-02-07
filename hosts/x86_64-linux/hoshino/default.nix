{ config, pkgs, ... }:

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

}

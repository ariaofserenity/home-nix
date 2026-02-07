{config, pkgs, ...}:

{ 

  networking = {
    hostName = "hoshino";
    interfaces = {
      ens18.ipv4.addresses = [{
        address = "192.168.2.10";
        prefixLength = 24;
      }];
    };
    defaultGateway = {
      address = "192.168.2.1";
    };
  };

}
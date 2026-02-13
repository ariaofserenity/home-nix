{ config, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timezone = "America/New_York";
  services.xserver.xkb.layout = "us";

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

  hardware.nvidia.prime = {
    intelBusId = "PCI:0@0:2:0";
    nvidiaBusId = "PCI:1@0:0:0";
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true; 

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

}

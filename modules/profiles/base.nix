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

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

}

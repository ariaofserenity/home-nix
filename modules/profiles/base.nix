{config, ...}:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  time.timezone = "America/New_York";
  services.xserver.xkb.layout = "us";
  nixpkgs.config.allowUnfree = true;
}
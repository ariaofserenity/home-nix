{ pkgs, ... }:

{
  aria = {
    roles = [ "base" ];
    groups = [ "wheel" "input"];
    extraPackages =
      pkgs: with pkgs; [
        steam
      ];
  };

  elaria = {
    roles = [ "base" ];
    groups = [ "wheel" "input"];
    extraPackages =
      pkgs: with pkgs; [
        steam
      ];
  };
}

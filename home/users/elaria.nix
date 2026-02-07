{ pkgs, ... }:

{
  home.username = "elaria";
  home.homeDirectory = "/home/elaria";
  home.stateVersion = "25.11";

  programs.zsh.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
    vim
  ];
}

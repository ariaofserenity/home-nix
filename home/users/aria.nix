{ pkgs, ... }:

{
  home.username = "aria";
  home.homeDirectory = "/home/aria";
  home.stateVersion = "25.11";

  programs.zsh.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
    vim
  ];
}

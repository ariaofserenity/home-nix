{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "aria";
  home.homeDirectory = "/home/aria";
  home.packages = with pkgs; [
    firefox
    vim
  ];
}

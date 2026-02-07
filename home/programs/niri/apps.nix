{
  pkgs,
}:

{
  #  browser = "${pkgs.firefox}/bin/firefox";
  browser = "firefox";
  terminal = "${pkgs.ghostty}/bin/alacritty";
  fileManager = "${pkgs.thunar}/bin/thunar";
  appLauncher = "${pkgs.walker}/bin/fuzzel";
}
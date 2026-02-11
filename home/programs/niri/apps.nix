{
  pkgs,
}:

{
  browser = "firefox";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  fileManager = "${pkgs.thunar}/bin/thunar";
  appLauncher = "${pkgs.walker}/bin/fuzzel";
}

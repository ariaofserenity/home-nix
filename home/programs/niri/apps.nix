{
  pkgs,
}:

{
  browser = "firefox";
  terminal = "${pkgs.ghostty}/bin/ghostty";
  fileManager = "${pkgs.thunar}/bin/thunar";
  appLauncher = "${pkgs.fuzzel}/bin/fuzzel";
}

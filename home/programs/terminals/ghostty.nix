{
  pkgs,
  lib,
  ...
}:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };
}

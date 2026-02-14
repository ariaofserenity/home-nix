{
  pkgs,
  lib,
  ...
}:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      font-size = 16;
      font-family = "Terminus";
      background-opacity = 0.95;
      theme = "noctalia";
    };
  };
}

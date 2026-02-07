{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    gitleaks
    gparted
    pavucontrol
    xwayland
    ffmpeg
    wineWowPackages.stable
  ];
}

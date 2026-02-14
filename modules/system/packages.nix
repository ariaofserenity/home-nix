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
    wineWow64Packages.stable
    winetricks
    bluez
    nixfmt
    feh
    lxappearance
  ];


}

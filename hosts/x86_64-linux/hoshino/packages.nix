{
  pkgs,
  inputs,
  ...
}:

let

in
with pkgs;
[
  # Applications
  protonplus
  lutris
  heroic
  prismlauncher
  thunar
  file-roller
  qbittorrent
  termius
  obsidian
  cider-2
  jan
  proton-pass

  # Games

  # TUI
  btop
  amdgpu_top
  superfile

  # Dev
  rustup
  python3
  gh
  nixfmt
  nixpkgs-fmt

  # Utilities
  jq
  socat
  tree
  libnotify
  wl-clipboard
  wlsunset
  pywalfox-native
  imagemagick
  rar
  unzip
  droidcam
  gpu-screen-recorder
  mpv
  cava
  dysk

  # Qs
  qt6Packages.qt5compat
  libsForQt5.qt5.qtgraphicaleffects
  kdePackages.qtbase
  kdePackages.qtdeclarative
  kdePackages.qtstyleplugin-kvantum
  wallust

  # Niri
  xwayland-satellite
  wl-clipboard
  inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
]
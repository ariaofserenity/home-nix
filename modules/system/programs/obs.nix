{
  pkgs,
  ...
}:

{
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      obs-vaapi
      obs-composite-blur
    ];
  };

  environment.systemPackages = with pkgs; [
    libva
    libva-utils
    libva-vdpau-driver
  ];
}

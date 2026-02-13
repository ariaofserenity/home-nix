{
  pkgs,
  ...
}:

{
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
    protontricks.enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
    args = [
      "--rt"
      "--expose-wayland"
    ];
  };

  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [
    libusb1
    usbutils
    libsndfile
    xwayland
    gamescope
    steam-run

    freetype
    fontconfig
    zenity
  ];

  services.udev.extraRules = ''
    SUBSYSTEM=="input", ATTRS{idVendor}=="2dc8", MODE="0660", GROUP="input"
    KERNEL=="hidraw*", ATTRS{idVendor}=="2dc8", MODE="0660", TAG+="uaccess"
  '';
}

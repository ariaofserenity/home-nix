{
  pkgs,
  inputs,
  ...
}:

{
  services.udev.extraRules = ''
    SUBSYSTEM=="input", ATTRS{idVendor}=="2dc8", MODE="0660", GROUP="input"
    KERNEL=="hidraw*", ATTRS{idVendor}=="2dc8", MODE="0660", TAG+="uaccess"
  '';
}

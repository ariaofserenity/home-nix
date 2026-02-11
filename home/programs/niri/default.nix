{
  inputs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
    ./settings.nix
    ./keybinds.nix
    ./noctalia.nix
    ./autostart.nix
  ];
}

{
  inputs,
  ...
}:
{

  imports = [
     inputs.aagl.nixosModules.default
  ];

  programs.the-honkers-railway-launcher.enable = true;
}

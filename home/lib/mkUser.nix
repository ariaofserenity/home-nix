{ pkgs, lib }:

{
  user,
  roles,
  extraPackages ? (_: [ ]),
}:

{
  imports = [ ../users/${user}.nix ] ++ map (r: ../roles/${r}.nix) roles;

  home.packages = extraPackages pkgs;
}

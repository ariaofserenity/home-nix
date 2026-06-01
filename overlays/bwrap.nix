nixpkgs-stable:
_final: prev: let
  stable = import nixpkgs-stable {
    inherit (prev.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
in {
  inherit (stable) bubblewrap;
}
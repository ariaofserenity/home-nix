{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    easy-hosts.url = "github:tgirlcloud/easy-hosts";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.easy-hosts.flakeModule ];

      systems = [ "x86_64-linux" ];

      easy-hosts = {
        autoConstruct = true;
        path = ./hosts;

        hosts.hoshino.tags = [ "base" ];

        perTag =
          let
            tags = {
              minimal =
                { modulesPath, ... }:
                {
                  imports = [ "${modulesPath}/profiles/base.nix" "${modulesPath}/profiles/gaming.nix"] "${modulesPath}/profiles/gpu/amd.nix"];
                };
            };
          in
          tag: {
            modules = [ tags.${tag} ];
          };
      };
    };
}
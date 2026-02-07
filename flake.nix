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

        hosts.hoshino.tags = [
          "base"
          "amd"
        ];
        hosts.yume.tags = [
          "base"
          "nvidia"
        ];

        perTag =
          let
            tags = {
              base =
                { modulesPath, ... }:
                {
                  imports = [ "${modulesPath}/profiles/base.nix" ];
                };
              amd =
                { modulesPath, ... }:
                {
                  imports = [ "${modulesPath}/system/gpu/amd.nix" ];
                };
              nvidia =
                { modulesPath, ... }:
                {
                  imports = [ "${modulesPath}/system/gpu/nvidia.nix" ];
                };
            };
          in
          tag: {
            modules = [ tags.${tag} ];
          };
      };
    };
}

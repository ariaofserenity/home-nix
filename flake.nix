{
  description = "NixOS configuration with easy-hosts and per-host home-manager users";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    easy-hosts.url = "github:tgirlcloud/easy-hosts";
  };

  outputs =
    inputs:
    inputs.easy-hosts.lib.mkFlake { inherit inputs; } {
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

        perTag = tag: {
          modules = [
            {
              base = ./modules/common.nix;
              amd = ./modules/amd.nix;
              nvidia = ./modules/nvidia.nix;
            }
            .${tag}
          ];
        };

        perHost = hostname: {
          modules = [
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };

              home-manager.users =
                let
                  hostUsers = ./home/hosts + "/${hostname}.nix";
                in
                if builtins.pathExists hostUsers then import hostUsers { inherit inputs; } else { };
            }
          ];
        };
      };
    };
}

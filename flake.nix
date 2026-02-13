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

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-xivlauncher-rb = {
      url = "github:ariaofserenity/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    easy-hosts.url = "github:tgirlcloud/easy-hosts";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        ];
        hosts.yume.tags = [
          "base"
        ];

        perTag =
          let
            tags = {
              base =
                { modulesPath, ... }:
                {
                  imports = [
                    (modulesPath + "/profiles/base.nix")
                    inputs.nixos-xivlauncher-rb.nixosModules.default
                  ];
                  nix.settings = inputs.aagl.nixConfig;
                };
            };
          in
          tag: {
            modules = [ tags.${tag} ];
          };
      };
    };
}

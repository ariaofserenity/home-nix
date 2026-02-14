{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-xivlauncher-rb = {
      url = "github:The1Penguin/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    nur = {
      url = "github:nix-community/NUR";
    };
    nixos-fonts.url = "github:Takamatsu-Naoki/nixos-fonts";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-xivlauncher-rb,
      aagl,
      nur,
      nix-flatpak,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        yume = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.overlays = [
                aagl.overlays.default
                nur.overlays.default
              ];
            }

            nixos-xivlauncher-rb.nixosModules.default

            { nixpkgs.config.allowUnfree = true; }

            { nix.settings = aagl.nixConfig; }

            ./modules/profiles/base.nix
            ./hosts/x86_64-nixos/yume
          ];
        };

        hoshino = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.overlays = [
                aagl.overlays.default
                nur.overlays.default
              ];
            }

            { nixpkgs.config.allowUnfree = true; }

            nixos-xivlauncher-rb.nixosModules.default
            nix-flatpak.nixosModules.nix-flatpak

            { nix.settings = aagl.nixConfig; }

            ./modules/profiles/base.nix
            ./hosts/x86_64-nixos/hoshino
          ];
        };
      };
    };
}

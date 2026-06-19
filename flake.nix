{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    rust-flake = {
      url = "path:./flakes/rust";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    android-flake = {
      url = "path:./flakes/android";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { self, nixpkgs, nixvim, home-manager, rust-flake, android-flake, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {

      maia = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/laptop/configuration.nix
          ./hosts/laptop/networking.nix
          ./hosts/laptop/programs.nix
          ./hosts/laptop/services.nix
          ./hosts/laptop/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          rust-flake.nixosModules.rust
          # android-flake.nixosModules.android-sdk
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [nixvim.homeModules.nixvim];
              users.nils = import ./hosts/laptop/home/nils.nix;
            };
          }
        ];
      };
    };
  };
}

{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixpkgs-statix = {
      url = "github:NixOS/nixpkgs/01fbdeef22b76df85ea168fbfe1bfd9e63681b30";
    };

    rust-flake = {
      url = "path:./flakes/rust";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # android-flake = {
    #   url = "path:./flakes/android";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nvf,
    home-manager,
    rust-flake,
    nixpkgs-statix,
    ...
  }: let
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
            nixpkgs.overlays = [
              (final: _prev: {
                inherit (nixpkgs-statix.legacyPackages.${final.system}) statix;
              })
            ];

            # nixpkgs.overlays = [
            #   (final: _prev: {
            #     statix = let
            #       src = final.fetchFromGitHub {
            #         owner = "molybdenumsoftware";
            #         repo = "statix";
            #         rev = "52530001bdbc8e94aae0d406a929c7ad7f09d9d1";
            #         hash = "sha256-5GBxiBDnhGJUCWc4Fc6YgODcJkUepV8dP/tY+lSrC5I=";
            #       };
            #     in
            #       final.rustPlatform.buildRustPackage {
            #         pname = "statix";
            #         version = "test-structured-attrs";
            #         inherit src;
            #         cargoHash = "sha256-E3/G8kVHFexNebkDXtDR5rucGRfmpUw6/At1/DDgBdQ=";
            #         buildFeatures = ["json"];
            #         meta.mainProgram = "statix";
            #       };
            #   })
            # ];

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [
                nvf.homeManagerModules.default
              ];
              users.nils = import ./hosts/laptop/home/nils.nix;
            };
          }
        ];
      };
    };
  };
}

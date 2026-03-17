{
  description = "nixos config";

  # nixConfig = {
  #   trusted-users = ["nils"];
  #   extra-substituters = [
  #     "https://nix-community.cachix.org"
  #   ];
  #
  #   extra-trusted-public-keys = [
  #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #   ];
  # };
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { self, nixpkgs, nixvim, home-manager, ... }: 
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {

      bellatrix = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/laptop/configuration.nix
          /etc/nixos/hardware-configuration.nix
          home-manager.nixosModules.home-manager
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

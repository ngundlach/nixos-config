{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {

      bellatrix = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/laptop/configuration.nix
          ./hosts/laptop/hardware-configuration.nix
        ];
      };
    };
  };
}

{
  description = "flake";

  # ...

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/pc/configuration.nix
        ./modules
      ];
    };
  };
}

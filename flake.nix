{
  description = "asynth's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-olympus.url = "github:UlyssesZh/nixpkgs/olympus";
  };

  outputs = { nixpkgs, nixpkgs-olympus, home-manager, ... }@inputs:
    let
      customLib =
        import ./customLib/default.nix { inherit inputs home-manager; };
    in with customLib; {
      nixosConfigurations = {
        pc = mkSystem "x86_64-linux" ./hosts/pc/configuration.nix
          ./hosts/pc/home.nix;
      };

      home-managerModules.default = ./home-managerModules;
      modules.default = ./modules;
    };
}

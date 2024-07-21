{
  description = "Pickles888's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixvim,
    home-manager,
    ...
  } @ inputs: let
    clib =
      import ./customLib/default.nix {inherit inputs home-manager;};
  in {
      nixosConfigurations = {
        NixPC =
          clib.mkSystem "x86_64-linux" ./hosts/pc/configuration.nix {inherit inputs nixvim clib;};

        NixLaptop =
          clib.mkSystem "aarch64-linux" ./hosts/laptop/configuration.nix {inherit inputs nixvim clib;};
      };

      home-managerModules.default = ./home-managerModules;
      modules.default = ./modules;
    };
}

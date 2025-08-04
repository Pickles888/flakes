{
  description = "Pickles888's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ow-mod-man = {
      url = "github:ow-mods/ow-mod-man";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    home-manager,
    nixpkgs,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    ctools =
      import ./ctools/default.nix {inherit inputs home-manager lib;};
  in rec {
      nixosConfigurations = {
        NixPC =
          ctools.mkSystem
          	"x86_64-linux"
          	./hosts/pc/configuration.nix
          	extraModules
          	{inherit inputs ctools;};

        NixLaptop =
          ctools.mkSystem
          	"aarch64-linux"
          	./hosts/laptop/configuration.nix
          	extraModules
          	{inherit inputs ctools;};
      };

			extraModules = [];

      home-managerModules.default = ./home-managerModules;
      modules.default = ./modules;
    };
}

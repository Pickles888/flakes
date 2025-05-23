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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plugin-markdown = {
      url = "github:MeanderingProgrammer/markdown.nvim";
      flake = false;
    };
  };

  outputs = {
    nixvim,
    home-manager,
    ...
  } @ inputs: let
    clib =
      import ./customLib/default.nix {inherit inputs home-manager;};
  in rec {
      nixosConfigurations = {
        NixPC =
          clib.mkSystem
          	"x86_64-linux"
          	./hosts/pc/configuration.nix
          	extraModules
          	{inherit inputs nixvim clib;};

        NixLaptop =
          clib.mkSystem
          	"aarch64-linux"
          	./hosts/laptop/configuration.nix
          	extraModules
          	{inherit inputs nixvim clib;};
      };

			extraModules = [
			];

      home-managerModules.default = ./home-managerModules;
      modules.default = ./modules;
    };
}

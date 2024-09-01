{ 
  inputs, 
  home-manager 
}: let
  outputs = inputs.self.outputs;
  customLib = (import ./default.nix) { inherit inputs; };
in {
  mkSystem = system: config: specialArgs:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = specialArgs;
      system = system;
      modules = [
        config
        inputs.self.outputs.modules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs customLib outputs; };
          home-manager.users.asynth = import inputs.self.outputs.home-managerModules.default;
	  home-manager.backupFileExtension = ".bak";
        }
      ];
    };
}

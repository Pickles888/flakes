{ 
  inputs, 
  home-manager,
  lib
}: let
  outputs = inputs.self.outputs;
  ctools = (import ./default.nix) { inherit inputs; };
in rec {
  mkSystem = system: config: extraModules: specialArgs:
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
          home-manager.extraSpecialArgs = { inherit inputs ctools outputs; };
          home-manager.users.asynth = import inputs.self.outputs.home-managerModules.default;
	  			home-manager.backupFileExtension = ".bak";
        }
      ] ++ extraModules;
    };

  concatMap = f: list: builtins.concatLists (map f list);
  switchList =
    list:
      concatMap (x: lib.lists.optionals x.switch x.pkgs) list;
}

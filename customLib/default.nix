{ inputs, home-manager }:
let
  outputs = inputs.self.outputs;
  customLib = (import ./default.nix) { inherit inputs; };
in rec {
  mkSystem = system: config: home-managerConfig: specialArgs:
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
          home-manager.extraSpecialArgs = { inherit inputs customLib; };

          home-manager.users.asynth = import home-managerConfig;
        }
      ];
    };
}

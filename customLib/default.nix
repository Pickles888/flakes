{ inputs, home-manager }: rec {
  mkSystem = system: config: home-managerConfig:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = system;
      modules = [
        config
        inputs.self.outputs.modules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.asynth = import home-managerConfig;
        }
      ];
    };
}

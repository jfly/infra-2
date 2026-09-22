{
  self,
  lib,
  inputs,
  ...
}:
{
  config = lib.mkMerge (
    lib.mapAttrsToList (name: type: {
      flake.nixosConfigurations.${name} = import ../nixosConfigurations/${name} {
        inherit inputs;
      };
      perSystem.checks."nixos/${name}" = self.nixosConfigurations.${name}.config.system.build.toplevel;
    }) (builtins.readDir ../nixosConfigurations)
  );
}

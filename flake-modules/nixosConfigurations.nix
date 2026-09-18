{ self, inputs, ... }:
{
  # TODO: move `makemake` into a nixosConfigurations subfolder and iterate over that.
  flake.nixosConfigurations.makemake = import ../makemake/default.nix { inherit inputs; };
  perSystem.checks."nixos/makemake" = self.nixosConfigurations.makemake.config.system.build.toplevel;
}

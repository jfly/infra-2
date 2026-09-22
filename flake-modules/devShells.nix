{
  perSystem = { config, pkgs, ... }: {
    devShells.default = pkgs.mkShellNoCC {
      packages = [
        pkgs.sops
        config.treefmt.build.wrapper
      ];
    };
  };
}

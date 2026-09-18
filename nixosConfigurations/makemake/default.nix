{ inputs, self }:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";

  modules = [
    # Setup both a master and a worker buildbot instance in this host
    inputs.buildbot-nix.nixosModules.buildbot-master
    inputs.buildbot-nix.nixosModules.buildbot-worker
    inputs.sops-nix.nixosModules.default
    self.nixosModules.offen
    ./configuration.nix
    { nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; }
  ];
}

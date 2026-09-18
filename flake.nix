{
  description = "ngi-nix infrastructure";

  inputs.buildbot-nix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.buildbot-nix.inputs.treefmt-nix.follows = "treefmt-nix";
  inputs.buildbot-nix.url = "github:nix-community/buildbot-nix";
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  inputs.sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.sops-nix.url = "github:Mic92/sops-nix";
  inputs.systems.url = "github:nix-systems/default-linux";
  inputs.treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.treefmt-nix.url = "github:numtide/treefmt-nix";

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        ./flake-modules/formatting.nix
        ./flake-modules/nixosConfigurations.nix
        ./flake-modules/devShells.nix
      ];
    };
}

{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = { pkgs, ... }: {
    treefmt = {
      programs.actionlint.enable = true;
      programs.keep-sorted.enable = true;
      programs.nixfmt.enable = true;
      programs.zizmor.enable = false;

      settings.formatter.editorconfig-checker = {
        command = pkgs.editorconfig-checker;
        includes = [ "*" ];
        priority = 9; # last
      };
    };
  };
}

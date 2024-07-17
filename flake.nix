{
  description = "Writing a Monkey Interpreter & Compiler in Go";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {
    flake-parts,
    devshell,
    treefmt-nix,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        devshell.flakeModule
        treefmt-nix.flakeModule
      ];
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        devshells = import ./shell.nix {inherit pkgs;};
        ## TODO: setup
        treefmt = {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true; ## nix
            gofumpt.enable = true; ## go
            prettier.enable = true; ## md
          };
          settings.global.excludes = [
            ".envrc"
            ".gitignore"
            "./.direnv/**"
          ];
        };
      };
      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.
      };
    };
}

{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      poetry2nix,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ poetry2nix.overlays.default ];
        };
        waybar-wtr = pkgs.poetry2nix.mkPoetryApplication { projectDir = ./.; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            python312Full
            poetry
          ];
        };
        packages.default = pkgs.callPackage waybar-wtr;
      }
    );
}

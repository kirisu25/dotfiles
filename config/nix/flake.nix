{
  description = "NixOS & home-manager configurations";

  inputs = {
    # Nix packages
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS hardware configurations
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Rust toolchain
    rust-overlay.url = "github:oxalica/rust-overlay";

    # Remote deployment
    deploy-rs.url = "github:serokell/deploy-rs";

    # xremap
    xremap.url = "github:xremap/nix-flake";

    # hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprsome.url = "github:sopa0/hyprsome";

  };

  outputs = inputs:
    let
      allSystems = [ "aarch64-linux" "x86_64-linux" ];
      forAllSystems = inputs.nixpkgs.lib.genAttrs allSystems;
    in {
      nixosConfigurations = (import ./hosts inputs).nixos;
      homeConfigurations = (import ./hosts inputs).home-manager;

      devShells = forAllSystems (system:
        let
          pkgs = import inputs.nixpkgs { inherit system; };
          scripts = with pkgs; [
            (writeScriptBin "switch-home" ''
              home-manager switch --flake ".#$@"
            '')
            (writeScriptBin "switch-nixos" ''
              sudo nixos-rebuild switch --flake ".#$@"
            '')
          ];
          #      devPkgs = [
          #        inputs.deploy-rs.packages.${pkgs.system}.default
          #      ];
          #      in {
          #        default = pkgs.mkShell {
          #          packages = scripts ++ devPkgs;
          #        };
          #      }
        in { default = pkgs.mkShell { packages = scripts; }; });
    };
}

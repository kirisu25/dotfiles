inputs: let
  mkNixosSystem = {
    system,
    hostname,
    username,
    modules,
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname username;
        };
      };

  mkHomeManagerConfiguration = {
    system,
    username,
    overlays,
    modules,
  }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system overlays;
        config = {
          allowUnfree = true;
        };
      };

      extraSpecialArgs = {
        inherit inputs username;
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit system overlays;
          config = {
            allowUnfree = true;
          };
        };
      };

      modules = modules ++ [
        {
          home = {
            inherit username;
            homeDirectory = "/home/${username}";
            stateVersion = "23.11";
          };
          programs.home-manager.enable = true;
          programs.git.enable = true;
        }
      ];
    };
  in {
    nixos = {
      x1c6th = mkNixosSystem {
        system = "x86_64-linux";
        hostname = "x1carbon6th";
        username = "kirisu25";
        modules = [
          ./x1carbon6th/nixos.nix
        ];
      };
    };
    home-manager = {
      "ubuntu@sakura" = mkHomeManagerConfiguration {
        system = "x86_64-linux";
        username = "ubuntu";
        overlays = [(import inputs.rust-overlay)];
        modules = [
          ./sakura/home-manager.nix
        ];
      };
      "kirisu25@x1c6th" = mkHomeManagerConfiguration {
        system = "x86_64-linux";
        username = "kirisu25";
        overlays = [(import inputs.rust-overlay)];
        modules = [
          ./x1carbon6th/home-manager.nix
        ];
      };
    };
  }

inputs: let
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
    home-manager = {
      "ubuntu@sakura" = mkHomeManagerConfiguration {
        system = "x86_64-linux";
        username = "ubuntu";
        overlays = [(import inputs.rust-overlay)];
        modules = [
          ./sakura/home-manager.nix
        ];
      };
    };
  }

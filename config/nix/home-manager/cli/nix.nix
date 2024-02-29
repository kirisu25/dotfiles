{pkgs, username, ...}: {
  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      accept-flake-config =true;
    };
  };
}

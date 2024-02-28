{pkgs, username, ...}: {
  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-commnad" "flakes"];
      accept-flake-config =true;
    };
  };
}

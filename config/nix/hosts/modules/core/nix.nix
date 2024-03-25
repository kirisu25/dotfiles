{
  nix = {
  	settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel"];
      accept-flake-config = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-order-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;
}

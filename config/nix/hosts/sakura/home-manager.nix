{pkgs, ...}: {
  imports = [
    ../../home-manager/cli/nix.nix
    ../../home-manager/cli/direnv.nix
    ../../home-manager/cli/git.nix
  ];

  home.packages = with pkgs; [
    #Language
    ## C
    gcc

    ## JS/TS
    nodePackages_latest.nodejs
    deno

    ## Rust
    rust-bin.stable.latest.default
  ];
}

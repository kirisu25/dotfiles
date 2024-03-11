{pkgs, ...}: {
  imports = [
    ../../home-manager/cli/default.nix
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

    ## go
    go
  ];
}

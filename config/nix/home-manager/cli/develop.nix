{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    go
    nodePackages_latest.nodejs
    deno
    bun
    rust-bin.stable.latest.default
    python3
  ];
             }

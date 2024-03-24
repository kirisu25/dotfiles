{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    go
    nodePackages_latest.nodejs
    deno
    rust-bin.stable.latest.default
  ];
             }

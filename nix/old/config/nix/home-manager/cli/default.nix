{pkgs, ...}: {
  imports = [
    ./direnv.nix
    ./git.nix
    ./nix.nix
    ./vim
    ./zsh
    ./tools.nix
    ./xdg.nix
    ./develop.nix
    ./ghq.nix
    ./helix.nix
  ];
}

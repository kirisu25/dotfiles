{pkgs, ...}: {
  imports = [
    ../../home-manager/cli/vim
    ../../home-manager/cli/direnv.nix
    ../../home-manager/cli/tools.nix
    ../../home-manager/cli/direnv.nix
    ../../home-manager/cli/helix.nix
    ../../home-manager/cli/develop.nix
    ../../home-manager/cli/git.nix
    ../../home-manager/cli/ghq.nix
  ];
}

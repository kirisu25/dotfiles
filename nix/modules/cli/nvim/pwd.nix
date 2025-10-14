{ config, ... }:
let
  pwd = "${config.home.homeDirectory}/dotfiles/nix/modules/cli/nvim";
in
{
  inherit pwd;
}

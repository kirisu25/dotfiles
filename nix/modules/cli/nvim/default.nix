{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    deno
  ];
}

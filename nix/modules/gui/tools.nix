{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    xfce.thunar
    zed-editor
  ];
}

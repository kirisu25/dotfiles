{ pkgs, ... }:
{
  home.packages = with pkgs; [
    google-chrome
    firefox-unwrapped
  ];
}

{ pkgs, ... }:
{
  home = rec {
    username = "kirisu25";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;

  imports = [
    ./modules/hyprland
    ./modules/cli
    ./modules/gui
  ];

  #wayland.windowManager.hyprland.settings = {

  # monitor = [
  #  "DP-1, 1920x1080@60, 0x0, 1"
  # ];

  #input.kb_layout = "us";

  #};
}

{ inputs, pkgs, ... }:
{
  #wayland.windowManager.hyprland = {
  # enable = true;
  # xwayland.enable = true;
  #};

  #home.file = {
  # "hyprland.conf" = {
  #  target = ".config/hypr/hyprland.conf";
  #  source = "./hyprland.conf";
  # };
  #};

  #wayland.windowManager.hyprland.settings = {
  # env = [
  #  "GTK_IM_MODULE, fcitx"
  #  "QT_IM_MODULE, fcitx"
  #  "XMODIFIERS, @im=fcitx"
  # ];

  # exec-once = [
  #  "fcitx5 -D"
  #  "waybar"
  #  "dunst"
  # ];

  # "$mainMod" = "SUPER";
  # "$subMod" = "ALT";
  # "$term" = "kitty";
  #};

  imports = [
    ./waybar
    ./ranger
    ./wofi
  ];

  home.packages =
    (with pkgs; [
      swww
      wl-clipboard
      wlogout
      wireplumber
      wineWowPackages.wayland
      winetricks
      networkmanagerapplet
    ])
    ++ [
      inputs.hyprsome.packages.${pkgs.system}.default # workspace manager
    ];

  # home.file = {
  #   "paper.jpg" = {
  #     target = ".config/hypr/wallpaper/paper.jpg";
  #     source = pkgs.fetchurl {
  #       url = "https://w.wallhaven.cc/full/yj/wallhaven-yjmmvx.jpg";
  #       sha256 = "sha256-iXiHRK6ocPQ80jfP8U6pXMEy0lKW/Glop4uoaTEBW8c=";
  #     };
  #   };
  # };
}

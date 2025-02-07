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
    ./mako
  ];

  home.packages =
    (with pkgs; [
      swww
      wl-clipboard
      wlogout
      wireplumber
      wineWowPackages.wayland
      winetricks
      unzip
      networkmanagerapplet
      hyprcursor
      nordzy-icon-theme
      nordzy-cursor-theme
    ])
    ++ [
      inputs.hyprsome.packages.${pkgs.system}.default # workspace manager
    ];

  home.file = {
    "paper.jpg" = {
      target = ".config/hypr/wallpaper/paper.jpg";
      source = ./images/paper.jpg;
    };
  };
}

{ inputs, pkgs, ... }:
{
  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

  # wayland.windowManager.hyprland.settings = {
  #   env = [
  #     "GTK_IM_MODULE, fcitx"
  #     "QT_IM_MODULE, fcitx"
  #     "XMODIFIERS, @im=fcitx"
  #   ];

  #   exec-once = [
  #     "fcitx5 -D"
  #     "waybar"
  #     # "dunst"
  #   ];

  #   "$mainMod" = "SUPER";
  #   "$subMod" = "ALT";
  # };

  imports = [
    ./waybar
    ./wofi
    ./mako
  ];

  home.packages =
    (with pkgs; [
      swww
      brightnessctl
      wl-clipboard
      wlogout
      wireplumber
      gtk3
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

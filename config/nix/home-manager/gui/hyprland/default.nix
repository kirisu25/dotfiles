{inputs, pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
  };

  home.packages = (with pkgs; [
    brightnessctl
    grimblast
    hyprpicker
    pamixer
    playerctl
    swww
    wev
    wl-clipboard
  ])
  ++ [
    inputs.hyprsome.packages.${pkgs.system}.default
  ];
}

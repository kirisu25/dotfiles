{
  imports = [
    ./fcitx5.nix
    ./sound.nix
    ./hyprland.nix
  ];

  programs = {
    dconf.enable = true;
  };
  xdg.portal.enable = true;
}

{
  imports = [
    ./fcitx5.nix
    ./sound.nix
  ];

  programs = {
    dconf.enable = true;
  };
  xdg.portal.enable = true;
}

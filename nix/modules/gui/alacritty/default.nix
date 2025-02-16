{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alacritty
    zellij
  ];

  home.file = {
    ".config/alacritty/alacritty.toml" = {
      target = ".config/alacritty/alacritty.toml";
      source = ./alacritty.toml;
    };

    ".config/alacritty/theme.toml" = {
      target = ".config/alacritty/theme.toml";
      source = ./theme.toml;
    };
  };
}

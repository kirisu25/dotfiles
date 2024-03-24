{
  programs.starship = {
    enable = true;
  };
  home.file = {
    "starship.toml" = {
      target = ".config/starship.toml";
      source = ./starship.toml;
    };
  };
}

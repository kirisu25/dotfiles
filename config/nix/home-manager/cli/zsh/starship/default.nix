{pkgs, ...}:
{
  programs.starship = {
    enable = true;
    settings = builins.fromTOML (builins.readFile ./starship.toml);
  };
}

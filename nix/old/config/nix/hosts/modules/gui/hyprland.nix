{inputs, ...}:
{
  imports = [inputs.hyprland.nixosModules.default];
  programs.hyprland.enable = true;

  services.xremap.withWlroots = true;
}

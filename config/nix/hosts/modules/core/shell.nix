{pkgs, ...}:
{
  programs = {
    zsh.enable = true;
    starship.enable = true;
    git.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    helix = {
      enable = true;
      settings = {
        theme = "tokyonight";
        editor = {
          line-number = "relative";
          cursor-shape.insert = "bar";
          indent-guides.ender = true;
        };
      };
    };
  };

  enviroment.systemPackages = with pkgs; [
    curl
    acpi
    duf
    lsof
    pciutils
    bottom
  ];
}

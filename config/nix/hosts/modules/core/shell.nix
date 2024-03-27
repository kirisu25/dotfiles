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

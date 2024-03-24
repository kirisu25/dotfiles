{pkgs, ...}: {
  home.packages = with pkgs; [
    # Utilities
    eza
    bat
    fzf
    ghq
    jq
    lazydocker
    lazygit
    ripgrep

    # Archves
    unar
    unrar
    unzip
    zip
  ];
             }

{pkgs, ...}: {
  home.packages = with pkgs; [
    # Utilities
    exa
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

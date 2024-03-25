{pkgs, ...}: {
  home.packages = with pkgs; [
    # Utilities
    eza
    bat
    fzf
    jq
    lazydocker
    lazygit
    ripgrep

    # Archves
    unar
    unrar
    unzip
    zip
    lha
  ];
             }

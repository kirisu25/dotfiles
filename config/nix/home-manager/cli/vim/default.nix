{pkgs, ...}: {
  programs.vim = {
    enable = true;
    extraConfig = ''
      set runtimepath+=$XDG_CONFIG_HOME/vim
    '';
  };
             }

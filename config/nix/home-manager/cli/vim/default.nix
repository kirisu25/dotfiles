{pkgs, ...}: {
  programs.vim = {
    enable = true;
    extraConfig = ''
      set runtimepath^=$XDG_CONFIG_HOME/vim

      runtime! dpp/dpp_init.vim
      runtime! init/*.vim
    '';
  };
}

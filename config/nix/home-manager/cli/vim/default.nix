{pkgs, ...}: {
#  programs.vim.enable = true;
  home.packages = [pkgs.vim];
  xdg.configFile."vim/vimrc".source = ./vimrc;
 # programs.zsh.profileExtra = ''
 #   export VIMINIT='let $MYVIMRC = !has("nvim") ? \
 #   "$XDG_CONFIG_HOME/vim/vimrc" : \
 #   "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'
 # '';
}

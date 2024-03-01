{pkgs, ...}: {
  programs.vim = {
    enable = true;
    extraConfig = ''
      set runtimepath+=$XDG_CONFIG_HOME/vim

      const s:dpp_base = expand('$XDG_CACHE_HOME/dpp/')

      const s:dpp_src = s:dpp_base . 'repos/github.com/Shougo/dpp.vim'
      if &runtimepath !~# 'dpp.vim'
        if !isdirectory(s:dpp_src)
          execute '!git clone https://github.com/Shougo/dpp.vim' s:dpp_src
        endif
        execute 'set runtimepath^=' . s:dpp_src
      endif

      const s:denops_src = s:dpp_base . 'repos/github.com/vim-denops/denops.vim'
      if &runtimepath !~# 'denops.vim'
        if !isdirectory(s:denops_src)
          execute '!git clone https://github.com/vim-denops/denops.vim' s:denops_src
        endif
        execute 'set runtimepath^=' . s:denops_src
      endif

      const s:ext_installer = s:dpp_base . 'repos/github.com/Shougo/dpp-ext-installer'
      if &runtimepath !~# 'dpp-ext-installer'
        if !isdirectory(s:ext_installer)
          execute '!git clone https://github.com/Shougo/dpp-ext-installer' s:ext_installer
        endif
        execute 'set runtimepath^=' . s:ext_installer
      endif

      const s:ext_lazy = s:dpp_base . 'repos/github.com/Shougo/dpp-ext-lazy'
      if &runtimepath !~# 'dpp-ext-lazy'
        if !isdirectory(s:ext_lazy)
          execute '!git clone https://github.com/Shougo/dpp-ext-lazy' s:ext_lazy
        endif
        execute 'set runtimepath^=' . s:ext_lazy
      endif

      const s:ext_toml = s:dpp_base . 'repos/github.com/Shougo/dpp-ext-toml'
      if &runtimepath !~# 'dpp-ext-toml'
        if !isdirectory(s:ext_toml)
          execute '!git clone https://github.com/Shougo/dpp-ext-toml' s:ext_toml
        endif
        execute 'set runtimepath^=' . s:ext_toml
      endif

      const s:pro_git = s:dpp_base . 'repos/github.com/Shougo/dpp-protocol-git'
      if &runtimepath !~# 'dpp-protocol-git'
        if !isdirectory(s:pro_git)
          execute '!git clone https://github.com/Shougo/dpp-protocol-git' s:pro_git
        endif
        execute 'set runtimepath^=' . s:pro_git
      endif

      if dpp#min#load_state(s:dpp_base)
        autocmd User DenopsReady
              \ call dpp#make_state(s:dpp_base, '$XDG_CONFIG_HOME/vim/dpp.ts')
      endif

      runtime! init/*.vim
    '';
  };
}

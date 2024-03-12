const s:dpp_base = '~/.cache/dpp'
const s:dpp_config = '~/.config/vim/dpp/dpp.ts'

let s:dpp_plugins = [
      \ 'Shougo/dpp.vim',
      \ 'Shougo/dpp-ext-installer',
      \ 'Shougo/dpp-ext-lazy',
      \ 'Shougo/dpp-ext-toml',
      \ 'Shougo/dpp-protocol-git',
      \ 'vim-denops/denops.vim',
      \ ]

for s:plugin in s:dpp_plugins->filter({_, val -> &runtimepath !~# '/' .. val->fnamemodify(':t')})
  let s:dir = expand(s:dpp_base .. '/repo/github.com/' .. s:plugin)
  if !(s:dir->isdirectory())
    execute '!git clone https://github.com/' .. s:plugin s:dir
  endif
  execute 'set runtimepath^=' . s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endfor

if dpp#min#load_state(s:dpp_base)
  autocmd User DenopsReady
        \ : echohl WarningMsg
        \ | echomsg 'dpp load_state() is failed'
        \ | echohl NONE
        \ | call dpp#make_state(s:dpp_base, s:dpp_config)
endif

autocmd User Dpp:makeStatePost
      \ : echohl WarningMsg
      \ | echomsg 'dpp make_state() is done'
      \ | echohl NONE

filetype indent plugin on

if has('syntax')
  syntax on
endif


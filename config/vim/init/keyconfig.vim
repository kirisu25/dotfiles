let mapleader = "\<Space>"
"----------
"Normal
"----------
nmap <Leader>a ggVG
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>nq :q!<CR>
nmap j gj
nmap k gk
nmap <ESC><ESC> :nohlsearch<CR>
nmap <Leader>gg :WWW
nmap <Leader>t :bo term<CR>
"----------
"Insert
"----------
imap <silent> jj <ESC>
"----------
"function
"----------
function! s:www(word) abort
  execute('vert term ++close ++shell w3m google.com/search\?q="' . a:word . '"')
endfunction

command! -nargs=1 WWW call s:www(<f-args>)

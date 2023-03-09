"------------------------------
"vim-airline
"------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'
"------------------------------
"vimdoc-ja
"------------------------------
set helplang=ja
"------------------------------
"vim-popyank
"------------------------------
nmap <Leader>y <Plug>(PopYank)
autocmd FileType go nmap <silent> <leader>ip :GoImpl<CR>

"------------------------------
"vim-airline
"------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'atomic'
let g:airline#extensions#tabline#buffer_idx_mode = 1
"------------------------------
"vimdoc-ja
"------------------------------
set helplang=ja
"------------------------------
"vim-popyank
"------------------------------
nmap <Leader>y <Plug>(PopYank)
autocmd FileType go nmap <silent> <leader>ip :GoImpl<CR>

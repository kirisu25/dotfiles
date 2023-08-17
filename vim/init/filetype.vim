augroup vimrc
    autocmd!
    autocmd Filetype * call s:filetype(expand('<amatch>'))
    runtime! vim-lsp.vim
augroup END

function! s:filetype(ftype) abort
    if !empty(a:ftype) && exists('*' . 's:filetype_' . a:ftype)
        execute 'call s:filetype_' . a:ftype . '()'
    endif
endfunction

function! s:filetype_go() abort
    nmap <Leader>gt :bo term go test -v<CR>
    nmap <Leader>run :bo term go run %<CR>
    nmap <Leader>doc :vert term go doc
endfunction

function! s:filetype_html() abort
    imap <buffer> </ </<C-x><C-o><ESC>F>a<CR><ESC>O
endfunction

function! s:filetype_md() abort
    nmap <Leader>p :PreviewMarkdown
endfunction

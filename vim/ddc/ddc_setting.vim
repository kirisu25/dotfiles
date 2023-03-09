"------------------------------
"ddc setting
"------------------------------
call ddc#custom#patch_global('ui', 'native')
"call ddc#custom#patch_global('sources', ['around'])
"call ddc#custom#patch_global('sourceOptions', {
"	\ '_': {
"	\   'matchers': ['matcher_head'],
"	\   'sorters': ['sorter_rank'],
"	\   'converters': ['converter_remove_overlap'],
"	\ },
"	\ 'around': {'mark': 'A'},
"	\ })

call ddc#custom#patch_global('sources', ['vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
	\ 'vim-lsp': {
	\   'matchers': ['matcher_head'],
  \   'mark': 'lsp',
	\ },
	\ })
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'ignoreCase': v:true
      \}})
" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

call ddc#enable()

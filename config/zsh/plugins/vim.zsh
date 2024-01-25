zinit ice as"program" atclone"rm -f src/auto/config.cache; \
	./configure --prefix=$ZPFX --with-features=huge --enable-multibyte \
	--enable-cscope --enable-python3interp --with-x \
	--enable-perlinterp --enable-rubyinterp --enable-fontset \
	--enable-xim --enable-terminal --enable-fail-if-missing" atpull"%atclone" \
	make"install" pick"$ZPFX/bin/vim"
zinit light vim/vim

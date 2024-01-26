zinit ice as"program" atclone"rm -f src/auto/config.cache; \
    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$ZPFX" atpull"%atclone" \
    make"install" pick"$ZPFX/bin/nvim"
zinit light neovim/neovim

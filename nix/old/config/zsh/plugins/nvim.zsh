#zinit ice as"program" atclone"rm -f src/auto/config.cache; \
#    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$ZPFX" atpull"%atclone" \
#    make"install" pick"$ZPFX/bin/nvim"
#zinit light neovim/neovim

# Build prerequisites
# Ubntu/deian: ninja-build gettext cmake unzip curl
# Arch Linux: base-devel cmake unzip ninja curl

zinit ice as"program" from"gh-r" \
  mv"ghq* -> ghq" \
  pick"ghq/ghq"
zinit light x-motemen/ghq

# function
if [[ $(command -v rg) ]] && [[ $(command -v fzf) ]]; then
    move_ghq_directories() {
      selected=`ghq list | fzf`
      if [ ${#selected} -gt 0 ]
      then
        target_dir="`ghq root`/$selected"
        echo "cd $target_dir"
        cd $target_dir
        zle accept-line
      fi
    }
    zle -N move_ghq_directories
    bindkey "^]" move_ghq_directories
fi

# w3m

function google() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            str="$str+$i"
        done
        str=`echo $str | sed 's/^\+//'`
        opt='search?num=50&hl=ja&lr=lang_ja'
        opt="${opt}&q=${str}"
    fi
    w3m http://www.google.co.jp/$opt
}

# ghq
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


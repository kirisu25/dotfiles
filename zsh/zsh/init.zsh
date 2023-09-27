###program
# bat
zinit ice as"program" from"gh-r" \
  mv"bat* -> bat" \
  pick"bat/bat"
zinit light sharkdp/bat

# exa
zinit ice as"program" from"gh-r"\
    mv"bin/exa* -> exa" \
    pick"exa/exa"
zinit light ogham/exa

# ripgrep
zinit ice as"program" from"gh-r" \
  mv"ripgrep* -> rg" \
  pick"rg/rg"
zinit light BurntSushi/ripgrep

# fzf
zinit ice as"program" from"gh-r" 
zinit light junegunn/fzf

incremental_search_history() {
  selected=`history -E 1 | fzf | cut -b 26-`
  BUFFER=`[ ${#selected} -gt 0 ] && echo $selected || echo $BUFFER`
  CURSOR=${#BUFFER}
  zle redisplay
}
zle -N incremental_search_history
bindkey "^R" incremental_search_history

#Interactive ripgrep
fzgrep() {
  INITIAL_QUERY=""
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \
    fzf --bind "change:reload:$RG_PREFIX {q} || true" \
        --ansi --phony --query "$INITIAL_QUERY" \
        --preview 'bat `echo {} | cut -f 1 --delim ":"`'
}
#ghq
zinit ice as"program" from"gh-r" \
  mv"ghq* -> ghq" \
  pick"ghq/ghq"
zinit light x-motemen/ghq

#asdf
zinit light asdf-vm/asdf
export ASDF_CONFIG_FILE=~/dotfiles/asdf/.asdfrc
export ASDF_DIR=~/.local/share/zinit/plugins/asdf-vm---asdf
fpath=(${ASDF_DIR}/completions $fpath)

#starship
zinit ice as"program" from"gh-r"
zinit light starship/starship

#gotop
zinit ice as"program" from"gh-r"
zinit light cjbassi/gotop

#zellij
zinit ice as"program" from"gh-r"
zinit light zellij-org/zellij

#mdr
zinit ice as"program" from"gh-r" \
    mv"mdr* -> mdr" \
    pick"mdr/mdr"
zinit light MichaelMure/mdr

#-----------------
# tool setting
#-----------------
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

# exa
if [[ $(command -v exa) ]]; then
    alias ls='exa --icons --git'
    alias la='exa -a --icons --git'
    alias ll='exa -aahl --icons --git'
    alias lt='exa -T -L 3 -a -I "node_modules|.git|.chace" --icons'
    alias lta='exa -T -a -I "node_modules|.git|.chace" --icons | less -r'
    alias lc='clear && ls'
fi

# tmux
#if [[ $(command -v tmux) ]]; then
#    if [ $SHLVL = 1 ]; then
#        tmux
#    fi
#fi

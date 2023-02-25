#---------------------------------------------------
### Added by Zinit's installer
#---------------------------------------------------
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

###zsh plugin
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
###program
#bat
zinit ice as"program" from"gh-r" \
  mv"bat* -> bat" \
  pick"bat/bat"
zinit light sharkdp/bat

#ripgrep
zinit ice as"program" from"gh-r" \
  mv"ripgrep* -> rg" \
  pick"rg/rg"
zinit light BurntSushi/ripgrep

#fzf
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

#asdf
zinit light asdf-vm/asdf
export ASDF_CONFIG_FILE=~/dotfiles/asdf/.asdfrc

#starship
zinit ice as"program" from"gh-r"
zinit light starship/starship

#gotop
zinit ice as"program" from"gh-r"
zinit light cjbassi/gotop

#zellij
zinit ice as"program" from"gh-r"
zinit light zellij-org/zellij
#---------------------------------------------------
###basic
#---------------------------------------------------
HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

##alias
#ls
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
#cd
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias dot='cd ~/dotfiles'
#apt
alias ai='sudo apt install'
alias au='sudo apt update'
alias ar='sudo apt remove'
#safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
#---------------------------------------------------
###completion
#---------------------------------------------------
autoload -Uz compinit && compinit

# 小文字でも大文字にマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補をTabや矢印で選択可能
zstyle ':completion:*:default' menu select=1
#---------------------------------------------------
###high-light
#---------------------------------------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

zstyle ':completion:*' list-colors $LSCOLORS
#---------------------------------------------------
###enable starship
#---------------------------------------------------
#starship is set to the default prompt.
#If the zsh default prompt is not loaded, starship 
#will not start properly. If it doesn't start well,
#`prompt default` should be mentioned.
#prompt default
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

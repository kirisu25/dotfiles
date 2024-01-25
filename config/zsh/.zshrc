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
    zdharma-continuum/zinit-annex-rust \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions

### End of Zinit's installer chunk
#---------------------------------------------------
### completion
#---------------------------------------------------
autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*:default' menu select=1
#---------------------------------------------------
### high-light
#---------------------------------------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

zstyle ':completion:*' list-colors $LSCOLORS

#---------------------------------------------------
### basic
#---------------------------------------------------
export LANG=ja_JP.UTF-8
export EDITOR='vim'

setopt print_eight_bit
setopt correct

HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
## alias
# ls
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# grep
alias grep='grep --color=auto'
# cd
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ~='cd ~'
# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# w3m
alias w3='w3m https://www.google.co.jp'
# local config
[ -f $ZDOTDIR/.zshrc.local ] && source $ZDOTDIR/.zshrc.local
if [ -d $ZDOTDIR ] && [ -r $ZDOTDIR ] && [ -x $ZDOTDIR ]; then
    for file in ${ZDOTDIR}/**/*.zsh; do
        [ -r $file ] && source $file
    done
fi
#---------------------------------------------------
### enable starship
#---------------------------------------------------
#starship is set to the default prompt.
#If the zsh default prompt is not loaded, starship 
#will not start properly. If it doesn't start well,
#`prompt default` should be mentioned.
#prompt default
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
#---------------------------------------------------
### ranger
#---------------------------------------------------
#if [[ $(command -v ranger) ]]; then
#    function ranger() {
#      if [ -z "$RANGER_LEVEL" ]; then
#        /usr/bin/ranger $@
#      else
#        exit
#      fi
#    }
#fi
#---------------------------------------------------
### tmux
#---------------------------------------------------
if [[ $(command -v tmux) ]]; then
    if [ $SHLVL = 1 ]; then
        tmux
    fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zinit ice as"program" from"gh-r"\
    mv"bin/exa* -> exa" \
    pick"exa/exa"
zinit light ogham/exa


# alias
alias ls='exa --icons --git'
alias la='exa -a --icons --git'
alias ll='exa -aahl --icons --git'
alias lt='exa -T -L 3 -a -I "node_modules|.git|.chace" --icons'
alias lta='exa -T -a -I "node_modules|.git|.chace" --icons | less -r'
alias lc='clear && ls'

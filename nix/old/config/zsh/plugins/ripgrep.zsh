zinit ice as"program" from"gh-r" \
  mv"ripgrep* -> rg" \
  pick"rg/rg"
zinit light BurntSushi/ripgrep

fzgrep() {
  INITIAL_QUERY=""
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \
    fzf --bind "change:reload:$RG_PREFIX {q} || true" \
        --ansi --phony --query "$INITIAL_QUERY" \
        --preview 'bat `echo {} | cut -f 1 --delim ":"`'
}

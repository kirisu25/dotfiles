zinit ice as"program" from"gh-r" atclone"./starship completions zsh > _starship" \
	atpull"%atclone"
zinit light starship/starship

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

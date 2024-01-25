zinit lucid as=program pick="$ZPFX/bin/fzf-tmux" \
    atclone="cp shell/completion.zsh _fzf_completion; \
        cp shell/key-bindings.zsh key-bindings.zsh; \
        cp bin/fzf-tmux $ZPFX/bin" \
    make="PREFIX=$ZPFX install" for \
        junegunn/fzf

# path
if [[ ! "$PATH" == ${HOME}/.local/share/zinit/plugins/junegunn---fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOME}/.local/share/zinit/plugins/junegunn---fzf/bin"
fi

# Auto-completion
# ---------------
source "${HOME}/.local/share/zinit/plugins/junegunn---fzf/shell/completion.zsh"

# Key bindings
# ------------
source "${HOME}/.local/share/zinit/plugins/junegunn---fzf/shell/key-bindings.zsh"

# OPTS
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=90% --layout=reverse --info=inline --border --margin=1 --padding=1"
export FZF_CTRL_T_OPTS="
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'
"
export FZF_CTRL_R_OPTS="
    --preview 'echo {}' --preview-window up:3:hidden:wrap
    --bind 'ctrl-/:toggle-preview'
    --color header:italic
"
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
export FZF_TMUX=1
export FZF_TMUX_OPTS="-p 80%"

# function
## move directory
fd() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf-tmux -p 80% --preview 'tree -C {}') && cd "$dir"
}

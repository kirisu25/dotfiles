zinit lucid as=program pick="$ZPFX/bin/fzf-tmux" \
    atclone="cp bin/fzf-tmux $ZPFX/bin" \
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
export FZF_DEFAULT_OPTS="--height=90% --layout=reverse --info=inline
--border --margin=1 --padding=1
--color=fg:#c5cdd9,bg:#262729,hl:#6cb6eb
--color=fg+:#c5cdd9,bg:#262729,hl:#5dbbc1
--color=info:#88909f,prompt:#ec7279,pointer:#d38aea
--color=marker:#a0c980,spinner:#ec7279,header:#5dbbc1
"
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
if [[ $(command -v fzf) ]]; then
## move directory
  fd() {
      local dir
      dir=$(find ${1:-.} -type d 2> /dev/null | fzf --preview 'tree -C {}') && cd "$dir"
  }

## file opening nvim
  nvim_fzf() {
    local file
    file=$(find | fzf --preview "bat -n --color=always {}")
    nvim $file
  }
  zle -N nvim_fzf
  bindkey "^N" nvim_fzf
fi

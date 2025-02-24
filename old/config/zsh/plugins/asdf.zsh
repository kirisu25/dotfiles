zinit light asdf-vm/asdf
#export ASDF_CONFIG_FILE=~/dotfiles/asdf/.asdfrc
export ASDF_DIR=~/.local/share/zinit/plugins/asdf-vm---asdf
fpath=(${ASDF_DIR}/completions $fpath)

#function
function vmi() {
    local lang=${1}
    
    if [[ ! $lang ]]; then
        lang=$(asdf plugin-list | fzf)
    fi

    if [[ $lang ]]; then
        local versions=$(asdf list-all $lang | fzf --tac --no-sort --multi)
        if [[ $versions ]]; then
            for version in $(echo $versions);
            do; asdf install $lang $version; done;
        fi
    fi
}

function vmc() {
    local lang=${1}

    if [[ ! $lang ]]; then
        lang=$(asdf plugin-list | fzf)
    fi

    if [[ $lang ]]; then
        local versions=$(asdf list $lang | fzf -m)
        if [[ $versions ]]; then
            for version in $(echo $versions);
            do; asdf uninstall $lang $version; done;
        fi
    fi
}

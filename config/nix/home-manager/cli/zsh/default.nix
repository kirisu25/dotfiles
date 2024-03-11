{pkgs, ...}: {
  imports = [./starship.nix];
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = ture;
    syntaxHighlighting = true;

    shellAliases = import ./alias.nix;

    initExtra = ''
      # nix
      export NIXPKGS_ALLOW_UNFREE=1
      # XDG
      export XDG_CONFIG_HOME=${HOME}/.config
      export XDG_CACHE_HOME=${HOME}/.cache
      export XDG_DATA_HOME=${HOME}/.local/share
      export XDG_STATE_HOME=${HOME}/.local/state
      export PATH=${HOME}/.local/bin:$PATH

      # editor
      export EDITOR=nvim
      export CVSEDITOR="${EDITOR}"
      export SVN_EDITOR="${EDITOR}"
      export GIT_EDITOR="${EDITOR}"
      
      # history
      export HISTFILE=${HOME}/.config/zsh/.zsh_history
      export HISTSIZE=1000
      export SAVEHIST=100000
      export HISTFILESIZE=100000
      setopt hist_ignore_dups
      setopt hist_ignore_all_dups
      setopt hist_ignore_space
      setopt hist_save_no_dups
      setopt hist_no_store
      setopt hist_verify
      setopt hist_reduce_blanks
      setopt hist_expand
      setopt EXTENDED_HISTORY
      setopt share_history

      # other
      export LISTMAX=100
      unsetopt bg_nice
      setopt list_packed
      setopt no_beep
      unsetopt list_types
      setopt print_eight_bit
      setopt correct

      # load config
      [ -f $ZDOTDIR/.zshrc.local ] && source $ZDOTDIR/.zshrc.local

      # Fuzzy find history
      function fzf-select-history(){
        BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle reset-prompt
      }
      zle -N fzf-select-history
      bindkey '^r' fzf-select-history

      # cd to the repository managed by GHQ
      function __ghq-cd() {
        cd $(ghq root)/$(ghq list | fzf)
        zle clear-screen
      }
      zle -N __ghq-cd
      bindkey '^]' __ghq-cd

    '';
  };
             }

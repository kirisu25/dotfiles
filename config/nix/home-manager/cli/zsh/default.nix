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
      export NIXPKGS_ALLOW_UNFREE=1

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

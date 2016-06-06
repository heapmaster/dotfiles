### VI mode ###
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^w' backward-kill-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

### Zsh options ###
setopt promptsubst
setopt append_history
setopt share_history
setopt hist_expire_dups_first

HISTSIZE=100000
SAVEHIST=80000

### Aliases ###
alias h="history"

alias s="search"
alias vi="vim"

### Functions ###
search() { open "http://google.com/search?q=`echo $@ | sed 's/ /+/g'`" ; }
wiki() { open "http://en.wikipedia.org/wiki/`echo $@ | sed 's/ /_/g'`" ; }

function comma() {
    if [ -z $1 ]; then
        local replace=","
    else
        local replace="$1"
    fi
    xargs | tr " " "$replace"
}


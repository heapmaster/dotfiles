### VI mode ###
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^w' backward-kill-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

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

function batt_percent() {
    pmset -g batt | grep InternalBattery | sed 's/.*	\([0-9][0-9]*%\);.*/\1/'
}

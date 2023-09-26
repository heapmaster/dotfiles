calc() { awk "BEGIN {print $*}" ; }

alias mendel="ssh snewberry@mendel"
alias morgan="ssh snewberry@login.morgan.haib.org"
alias th="ssh snewberry@th.morgan.haib.org"
alias o_mendel="ssh snewberry@mendel.hudsonalpha.org"
alias services="ssh snewberry@services.myerslab.haib.org"
alias h="history"
alias laptop="echo 172.26.14.18"
alias desktop="echo 172.26.12.65"
alias ll="ls -l"
alias s="search"
alias r="fc -s"
alias vi="vim"
alias umount.mac="diskutil unmount"

search() { open "http://google.com/search?q=`echo $@ | sed 's/ /+/g'`" ; }
lucky() { open "http://google.com/search?q=`echo $@ | sed 's/ /+/g'`&btnI" ; }
wiki() { open "http://en.wikipedia.org/wiki/`echo $@ | sed 's/ /_/g'`" ; }

function code() {
    cd ~/code/$1
}

if [ -e ~/.javarc ]; then
    . ~/.javarc
fi

if [ -e ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

if [ -e /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
    GIT_PS_1="__git_ps1 \" (%s)\""
fi

function comma() {
    if [ -z $1 ]; then
        local replace=","
    else
        local replace="$1"
    fi
    xargs | tr " " "$replace"
}

export GIT_PS1_SHOWDIRTYSTATE=1

export PATH="$PATH:~/node_modules/.bin:/Users/scottnewberry/.rd/bin"

#Prompt and prompt colors
# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# 0 - Normal
# 1 - Bold
function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESET="\[\033[00m\]" 
export PS1="[\u@\h \W]$YELLOW\$($GIT_PS_1)$RESET$ "
}
prompt

alias ub_local="docker run --rm -it -v `pwd`:/here ubuntu /bin/bash"
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/scottnewberry/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

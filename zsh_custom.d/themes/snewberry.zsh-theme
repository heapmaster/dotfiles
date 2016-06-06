
function batt_percent() {
    which pmset > /dev/null && pmset -g batt | grep InternalBattery | sed 's/.*	\([0-9][0-9]*\)%;.*/\1/'
}

function batt_percent_colored() {
    typeset -i PERC=$(batt_percent)
    if [ ! -z $PERC ]; then
        typeset PCOLOR="yellow"
        if [ $PERC -ge 50 ]; then
            PCOLOR="green"
        elif [ $PERC -le 25 ]; then
            PCOLOR="red"
        fi
        echo "%{$fg[$PCOLOR]%}$PERC%%%{$reset_color%}"
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

PROMPT='${ret_status}%{$reset_color%} %{$fg[cyan]%}%n@%m: %{$fg[magenta]%}%1~%{$reset_color%} $(git_prompt_info)'
RPROMPT='$(batt_percent_colored)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗%{$reset_color%}"
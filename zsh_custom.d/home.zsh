if [[ ! -z $MY_ENVIRONMENT ]]; then
    if [[ $MY_ENVIRONMENT == "home" ]]; then
        function code() {
            cd ~/Dropbox/personal_repos/$1
        }
    fi
fi

GOPATH="$HOME/go"
PATH="$HOME/.cargo/bin:$PATH:$GOPATH/bin"

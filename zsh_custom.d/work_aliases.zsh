if [[ ! -z $MY_ENVIRONMENT ]]; then
    if [[ $MY_ENVIRONMENT == "work" ]]; then
        alias morgan="ssh snewberry@login.morgan.haib.org"
        alias th="ssh snewberry@th.morgan.haib.org"
        alias services="ssh snewberry@services.myerslab.haib.org"
        alias vertica="/Users/snewberry/vertica/osx/vsql -d vertica -B vertica-ce-lin1:5433 -U dbadmin"

        function code() {
            cd ~/Box\ Sync/my_repos/$1
        }
    fi
fi

#!/bin/bash

remote=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD))
pruned=true

ALL=false
BRANCH=$remote
FETCH=false
PRUNE=false

while true; do
  case "$1" in
    -a | --all ) ALL=true; shift ;;
    -f | --fetch ) FETCH=true; shift ;;
    -p | -fp | -pf | --prune ) PRUNE=true; shift ;;
    -af | -fa ) ALL=true; FETCH=true; shift ;;
    -ap | -pa ) ALL=true; PRUNE=true; shift ;;
    -b | --branch ) BRANCH="$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

if [[ $PRUNE = true ]]; then
    git fetch -p
elif [[ $FETCH = true ]]; then
    git fetch
fi

print_status () {
    ahead=$(git rev-list "$1..HEAD" --count)
    behind=$(git rev-list "HEAD..$1" --count)

    printf "\e[39m%-27s" $1

    if [[ $ahead -gt 0 ]]; then
        printf "\e[32m%4d ahead\e[39   " $ahead
    else
        if [[ $behind -eq 0 ]]; then
            printf "\e[94m       Up to date\e[39"
        else
            printf "\e[39m          \e[39"
        fi
    fi

    if [[ $behind -gt 0 ]]; then
        printf "\e[31m%4d behind\e[39" $behind
    fi

    echo
}

if [[ $(git rev-parse --quiet --verify origin/master | awk '{print length}') -ne 0 ]]; then
    print_status origin/master
fi

if [[ $(git rev-parse --quiet --verify $BRANCH | awk '{print length}') -eq 0 ]]; then
    printf "\e[31mNo remote tracking branch\e[39" ""
    echo
elif [[ $BRANCH != 'origin/master' ]]; then
    print_status $BRANCH
fi


for branch in $(git branch -r)
do
    if [[ $ALL = true && $branch != origin/master && $branch != origin/HEAD && $branch != '->' && $branch != $BRANCH ]]; then
        print_status $branch
    fi
done

echo
git status -s

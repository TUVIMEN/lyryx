#!/bin/bash
# by Dominik Stanisław Suchora <hexderm@gmail.com>
# License: GNU GPLv3

IFS=$'\n'

tested_program='./lyryx'
tested_program_rp="$(realpath "$tested_program")"

get_hash() {
    md5sum | cut -d ' ' -f1
}

get_dir_tree() {
    local i name
    for i in $(find)
    do
        if [ -f "$i" ]
        then
            echo "$i -" "$(get_hash < "$i")"
        else
            echo "$i"
        fi
    done
}

exec_test() {
    dir="$(mktemp -d)"
    trap 'rm -r "$dir" &>/dev/null' HUP INT QUIT TERM PWR EXIT RETURN
    pushd "$dir" &>/dev/null
    eval "$tested_program_rp $@" >/dev/null
    get_dir_tree | get_hash
    popd &>/dev/null
}

exec_line() {
    if grep -Eq '^[a-fA-F0-9]{32},.+' <<< "$1"
    then
        phash="$(cut -b 1-32 <<< "$1")"
        pcommand="$(cut -b 34- <<< "$1")"
        ohash="$(exec_test "$pcommand")"
        [ "$ohash" != "$phash" ] && echo "$tested_program $pcommand - failed" >&2
    fi
}

exec_file() {
    local i
    while read -r i
    do
        exec_line "$i"
    done < "$1"
}

if [ "$#" -eq 0 ]
then
    exec_file "test.test"
    exit
fi

if [ "$#" -eq 1 -a -f "$1" ]
then
    exec_file "$1"
else
    exec_test "$@"
fi

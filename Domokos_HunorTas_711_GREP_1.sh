#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Es muss genau ein Parameter angegeben werden!"
    exit 1
fi

if [[ ! -d "$1" ]]; then
    echo "Ordner existiert nicht!"
    exit 1
fi

if [[ ! -r "$1" ]]; then
    echo "Ordner hat keine Leserechte!"
    exit 1
fi

grep -rhs --include="*.txt" "^" "$1"

exit 0

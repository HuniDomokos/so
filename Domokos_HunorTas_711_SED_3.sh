#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "Fehler: Es müssen mindestens 2 Parameter angegeben werden (Suchtext und Datei(en))!"
    exit 1
fi

SUCHTEXT="$1"

if [[ -z "$SUCHTEXT" ]]; then
    echo "Fehler: Der Suchbegriff darf nicht leer sein!"
    exit 1
fi

for DATEI in "${@:2}"; do
    
    if [[ "$DATEI" != *.txt ]]; then
        echo "Fehler: '$DATEI' ist keine .txt Datei!"
        continue
    fi

    if [[ ! -e "$DATEI" ]]; then
        echo "Fehler: Die Datei '$DATEI' existiert nicht!"
        continue
    fi

    if [[ ! -r "$DATEI" ]]; then
        echo "Fehler: Keine Leserechte für '$DATEI'!"
        continue
    fi

    sed "1,30{/$SUCHTEXT/d;}" "$DATEI"
done

exit 0

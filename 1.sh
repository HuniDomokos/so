#!/bin/bash

if [[ ! -w . ]]; then
	echo "Keine Schreibrechte in $(pwd)"
	exit
fi

if [[ ! -x . ]]; then
	echo "Keine Ausfuhrungsrechte in $(pwd)"
	exit
fi

if [[ $# != 2 ]]; then
	echo "Es mussen 2 Argumente ubergeben werden"
	exit
fi

if [[ ! $1 =~ ^[0-9]+$ ]]; then
	echo "Anzahl der Ordner muss eine positive ganze Zahl sein"
	exit
fi

if [[ ! $2 =~ ^[0-9]+$ ]]; then
	echo "Anzahl der Dateien muss eine positive ganze Zahl sein"
	exit
fi

if [[ $1 == 0 && $2 != 0 ]]; then
	echo "Anzahl der Ordner kann nicht 0 sein."
	exit
fi

for (( i=1 ; i <= $1 ; i++ )); do
	ordner_name="ordner$i"

	if [[ -e "$ordner_name" ]]; then
		echo "ordner$i existiert bereits -> wird ubersprungen"
		continue
	fi

	if  ! mkdir "$ordner_name" 2>/dev/null; then
		echo "$ordner_name konnte nich erstellt werden"
		exit
	fi


for (( j=1 ; j <= $2 ; j++ )); do
	touch "$ordner_name/datei$j.txt"
done
done


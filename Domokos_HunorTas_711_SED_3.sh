 #!/bin/bash

if [[ $# -ne 2 ]];then
	echo 'Anzahl der Parameter muss 2 sein!'
	exit 1
fi

if [[ -z "$1" || "$1" == *$'\n'* ]];then
	echo "Der Suchbegriff ist leer oder ungultig!"
	exit 1
fi

if [[ "$2" != *.txt ]];then
	echo "Der zweite Parameter muss eine .txt Datei sein!"
	exit 1
fi

if [[ ! -e "$2" ]];then
	echo "Die Datei existiert nicht!"
	exit 1
fi

if [[ ! -w "$2" || ! -r "$2" ]];then
	echo "Die Datei kann nicht gelesen oder bearbeitet werden!"
	exit 1
fi



sed -i "1,30{/$1/d}" "$2"

exit 0

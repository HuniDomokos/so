#!/bin/bash

if [[ $# != 1 ]]; then
	echo "Es darf nur ein Parameter ubergeben werden!"
	exit 1
fi

if [[ ! $1 ~= "*.csv$" ]]; then
	echo "Der Parameter muss eine .csv Datei sein!"
	exit
fi

if [[ ! -r $1 || ! -e  $1 || ! -f $1 ]]; then
	echo "Der Parameter ist keine Datei, sie existiert nicht, oder kann nicht geoffnet werden."
	exit 1
fi

awk -F "," '{
	sum = 0;
	count = 0;
	for (i=2, i<NF,i++){
	 sum+=$i;
	 count++;
	}


	if (count > 0){
	 avg = sum/count;
	}
	else {
	avg = 0
	}
	print '$1' "," avg;
}' "$1" > durchschnitt.csv


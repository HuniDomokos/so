#!/bin/bash

for (( i=1;i<=$#;i++ )); do

	if [[ ! -e "${!i}" ]]; then
		continue
	fi

	if [[ ! -f "${!i}"  ]]; then
		continue
	fi

	if [[ ! -r "${!i}" ]]; then
		continue
	fi

	awk '{line[NR] = $0} END {for ( j = NR; j > 0; j-- ) print line[j]}' "${!i}"
done

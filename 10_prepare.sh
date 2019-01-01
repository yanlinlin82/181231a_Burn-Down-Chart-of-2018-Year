#!/bin/bash

mkdir -pv data

if [ ! -e "data/2018-reading-date.txt" ]; then
	echo 1>&2 "Generate 'data/2018-reading-date.txt'"
	cat ~/Documents/TODO/Reading.md | tail -n+254 | sed -E 's/^\s*([0-9]+)(-([0-9]+))?.*【([0-9]+)月([0-9]+)日.*$/\1 \3 \4 \5/g' | awk 'BEGIN{print"no\tdate"}{if($4==""){printf"%d\t2018-%02d-%02d\n",$1,$2,$3}else{for(i=$1;i<=$2;++i){printf"%d\t2018-%02d-%02d\n",i,$3,$4}}}' > data/2018-reading-date.txt
fi

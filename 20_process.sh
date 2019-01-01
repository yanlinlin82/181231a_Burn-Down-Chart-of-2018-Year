#!/bin/bash

mkdir -pv plots

if [ ! -e "plots/2018-burn-down.png" ]; then
	Rscript scripts/plot.R
fi

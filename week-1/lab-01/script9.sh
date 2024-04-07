#!/bin/bash


nombre_fecha=$(date +%Y-%m-%d)

for archivo in *.txt; do
    mv "$archivo" "${archivo%.txt}_$nombre_fecha.txt"
done
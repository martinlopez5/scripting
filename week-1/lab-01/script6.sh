#!/bin/bash

read -p "Ingrese el nombre del archivo a buscar: " nombre_archivo
find $nombre_archivo
cat $nombre_archivo
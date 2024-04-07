#!/bin/bash

touch prueba6
echo "¡FELICITACIONES! Usted ha encontrado correctamente el archivo" >> prueba6
read -p "Ingrese el nombre del archivo a buscar: " archivo_buscado

while [ ! -f "$archivo_buscado" ]; do
    echo "El archivo no fue encontrado, intente con otro nombre. Ej: prueba6"
    echo "Ingrese nuevamente el nombre del archivo a buscar: "
    read archivo_buscado
done

echo "El archivo fue encontrado correctamente, este es su contenido: "
cat prueba6
rm prueba6
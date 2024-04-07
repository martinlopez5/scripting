#!/bin/bash

archivo_origen="archivo.txt"
archivo_destino="copia_archivo.txt"

echo "Hola, Mundo!" > archivo.txt

cp "$archivo_origen" "$archivo_destino"

echo "La informacion fue copiada con exito!"

echo "Esto fue lo que se copio: "
echo "------------------------"
cat "$archivo_destino"
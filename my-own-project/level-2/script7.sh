#!/bin/bash

# Verificar que se proporcionó la fecha como argumento al script
if [ $# -eq 0 ]; then
    echo "Uso: $0 YYYY-MM-DD"
    exit 1
fi

# Almacenar la fecha proporcionada como argumento en una variable
fecha="$1"

# Definir el directorio donde se encuentran los archivos de log
directorio_logs="/ruta/al/directorio/de/logs"

# Patrón para buscar errores "404 Not Found" en los archivos de log
patron="404 Not Found"

# Bucle para procesar cada archivo de log en el directorio
for archivo_log in "$directorio_logs"/*.log; do
    # Verificar si el archivo de log existe
    if [ -f "$archivo_log" ]; then
        # Filtrar las líneas que contienen el patrón y la fecha específica
        errores=$(grep "$fecha" "$archivo_log" | grep "$patron" | wc -l)
        # Mostrar el nombre del archivo y el número de errores encontrados
        echo "Archivo: $(basename "$archivo_log") - Errores 404 Not Found: $errores"
    fi
done

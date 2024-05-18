#!/bin/bash

# Directorio de origen que se va a respaldar
origen="/ruta/a/tu/directorio"

# Directorio de destino donde se almacenarán los backups
destino="/ruta/a/tu/directorio_de_backups"

# Nombre del directorio de backup incremental (se usa la fecha actual)
backup_dir="$destino/backup_$(date +'%Y-%m-%d')"

# Verificar si el directorio de destino existe, si no, crearlo
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

# Realizar el backup incremental utilizando rsync
rsync -av --delete --link-dest="$destino/backup_anterior" "$origen" "$backup_dir"

# Actualizar el enlace simbólico al último backup para la próxima vez
rm -f "$destino/backup_anterior"
ln -s "$backup_dir" "$destino/backup_anterior"



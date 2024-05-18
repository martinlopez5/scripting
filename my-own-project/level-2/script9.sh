#!/bin/bash

read -p "Ingrese el nombre de la imagen: " image_name
read -p "Ingrese el TAG de la imagen: " tag_name
read -p "Ingrese la ubicacion del DOCKERFILE. En el caso de estar en la misma ubicacion, ingrese . :" location_dockerfile

docker build -t "$image_name":"$tag_name" "$location_dockerfile"

read -p "Desea crear un contenedor con la imagen creada? (yes/no): " create_container

if [ "${create_container,,}" == "yes"  ]; then
    read -p "Ingrese el nombre del CONTENEDOR: " container_name
    read -p "Ingrese los puertos separados por : (ej: 80:8080): " ports
    docker run -d --name "$container_name" -p "$ports" "$image_name":"$tag_name"
    sleep 5
    docker ps -a
    echo "======================================================================"
    echo "======================================================================"
    sleep 2
    docker logs "$container_name"
else
    exit 1
fi

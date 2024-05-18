#!/bin/bash

read -p "Ingrese el nombre del servicio a consultar: " service_name

if systemctl is-active --quiet "$service_name"; then
    echo "El servicio "$service_name" esta ACTIVADO."
else
    echo "El servicio "$service_name" NO esta activado."
    echo "=============================================="
    read -p "Desea activar el servicio "$service_name"? (yes/no)" service_status
    if [ "$service_status" == yes ]; then
        echo "Activando el servicio........."
        systemctl start "$service_name" && systemctl enable "$service_name" >> log_service 2>&1
        echo "El servicio "$service_name" fue activado correctamente"
    else
        exit 1
    fi
fi
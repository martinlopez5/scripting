#!/bin/bash

# Verificar que se proporcionaron los argumentos correctos
if [ $# -ne 2 ]; then
    echo "Uso: $0 interfaz dirección_ip/máscara"
    exit 1
fi

# Almacenar los argumentos proporcionados en variables
interfaz="$1"
direccion_ip="$2"

# Configurar la dirección IP estática en la interfaz de red seleccionada
ip addr add "$direccion_ip" dev "$interfaz"

# Reiniciar la interfaz de red para aplicar la configuración
systemctl restart networking

# Esperar unos segundos para que la interfaz se reinicie correctamente
sleep 5

# Verificar la configuración aplicada mostrando la información de la interfaz
ip addr show "$interfaz"
#!/bin/bash

destinatario="correo_destino@example.com"
asunto="Alerta: Problema en el sistema"
mensaje="Se ha detectado un problema en el sistema. Por favor, revisa el estado del servidor."


df -h

if df -h | awk 'NR>1 && $5+0 >= 80 {print}' | grep -q '.'; then
    echo "Se encontro un disco a mas del 80% de su capacidad."
    echo "Enviando alerta por mail............"
    #echo "$mensaje" | mail -s "$asunto" "$destinatario"
    sleep 3
    echo "El email se envio correctamente, por favor revise su casilla."
else
    echo "No se encontro ningun disco al 80% de su capacidad."
fi

# tengo que modifcar que en realidad busque que sea 80 o mas, ya que en este caso, si es 81 no hace nada.
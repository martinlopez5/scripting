#!/bin/bash

# URL de la API REST que vamos a consultar (en este caso, JSONPlaceholder)
API_URL="https://jsonplaceholder.typicode.com/users"

# Realizar la solicitud GET a la API y almacenar la respuesta en un archivo temporal
response=$(curl -sS "$API_URL")

# Verificar si la solicitud fue exitosa
if [ $? -eq 0 ]; then
    # Parsear la respuesta JSON y extraer información relevante
    user_count=$(echo "$response" | jq '. | length')
    echo "Número de usuarios encontrados: $user_count"

    # Iterar sobre cada usuario en la respuesta JSON
    for ((i = 0; i < user_count; i++)); do
        user_name=$(echo "$response" | jq -r ".[$i].name")
        user_email=$(echo "$response" | jq -r ".[$i].email")
        echo "Usuario $((i + 1)): $user_name ($user_email)"
    done

    # Realizar acciones adicionales basadas en los datos recibidos
    # Por ejemplo, enviar un correo electrónico, guardar los datos en un archivo, etc.

else
    echo "Error al obtener datos de la API."
fi

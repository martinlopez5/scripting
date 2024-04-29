#!/bin/bash

read -p "Ingresa la palabra que quiere analizar: " palabra

echo "MENU OPCIONES: "
echo "-------------------------------------------------------"
echo "1. Mostrar las dos primeras letras de una palabra."
echo "2. Mostrar las tres primeras letras de una palabra."
echo "3. Mostrar las cuatro primeras letras de una palabra."
echo "4. Mostrar las últimas cuatro letras de una palabra."
echo "5. Mostrar las últimas tres letras de una palabra."
echo "6. Mostrar las últimas dos letras de una palabra."
echo "7. Mostrar la última letra de una palabra."
echo "8. Salir."
echo "-------------------------------------------------------"

read -p "Ingrese la opcion deseada (1-8): " opcion

case $opcion in
    1)
        echo "Usted selecciono mostrar sus dos primeras letras."
        echo "Las primeras dos letras de $palabra son: $(echo "$palabra" | cut -c 1-2)"
        ;;
    2)
        echo "Usted selecciono mostrar sus tres primeras letras."
        echo "Las primeras tres letras de $palabra son: ${palabra:0:2}"
        ;;
    3)
        echo "Usted selecciono mostrar sus cuatro primeras letras."
        echo "Las primeras cuatro letras de $palabra son: ${palabra:0:4}"
        ;;
    4)
        echo "Usted selecciono mostrar sus ultimas cuatro letras."
        echo "Las ultimas cuatro letras de $palabra son: $(echo "$palabra" | rev | cut -c 1-4 | rev)"
        ;;
    5)
        echo "Usted selecciono mostrar sus ultimas tres letras."
        echo "Las ultimas tres letras de $palabra son: $(echo "$palabra" | rev | cut -c 1-3 | rev)"
        ;;
    6)
        echo "Usted selecciono mostrar sus ultimas dos letras."
        echo "Las ultimas dos letras de $palabra son: $(echo "$palabra" | rev | cut -c 1-2 | rev)"
        ;;
    7)
        echo "Usted selecciono mostrar su ultima letra."
        echo "La ultima letra de $palabra son: $(echo "$palabra" | rev | cut -c 1 | rev)"
        ;;
    8)
        echo "Usted selecciono Salir."
        exit 1
        ;;
    *)
        echo "Numero invalido."
        exit 1
        ;;
esac
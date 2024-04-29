#!/bin/bash

function calc_farenheit {
    local num=$1
    temp_farenheit=$(( num * 9/5 + 32 ))
    echo "La temperatura "$num" grados Celsius es igual a "$temp_farenheit" grados Farenheit"
}

function calc_celsius {
    local num=$1
    temp_celsius=$(( ( num - 32 ) * 5/9 ))
    echo "La temperatura "$num" grados Farenheit es igual a "$temp_celsius" grados Celsius"
}

read -p "Ingrese el numero de la temperatura a convertir: " temperatura
read -p "Ingrese C para Celsius o F para Farenheit: " letra_temperatura

echo "MENU OPCIONES: "
echo "-------------------------------------------------------"
echo "1. Convertir a grados Celsius."
echo "2. Convertir a grados Farenheit."
echo "3. Salir."
echo "-------------------------------------------------------"

read -p "Ingrese la opcion deseada (1-3): " opcion

case $opcion in
    1)
        if [[ "$letra_temperatura" == [Ff] ]]; then
            calc_celsius $temperatura
        else
            echo "Opcion no valida. Saliendo del programa..."
        fi
        ;;
    2)
        if [[ "$letra_temperatura" == [Cc] ]]; then
            calc_farenheit $temperatura
        else
            echo "Opcion no valida. Saliendo del programa..."
        fi
        ;;
    3)
        echo "Usted selecciono SALIR."
        exit 1
        ;;
    *)
        echo "Opcion no valida."
        ;;

esac


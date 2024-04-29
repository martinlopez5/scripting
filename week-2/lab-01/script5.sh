#!/bin/bash

## Construir un programa que permita registrar los movimientos de deposito y retiro de dinero de una Cuenta Bancaria de manera que se pueda controlar el saldo. ##

my_database="movimientos.txt"


echo "---MENU DE OPCIONES---"
echo "1. Realizar un deposito a la cuenta."
echo "2. Realizar un retiro de la cuenta."
echo "3. Consultar el estado de la cuenta."
echo "4. Salir."


read -p "Ingrese la opcion deseada: " options

ultimo_numero=$(tail -n 1 "$my_database" | awk '{print $1}')

case $options in
    1)
        read -p "Ingrese el monto a depositar (solamente el numero): " nuevo_deposito
        if ! [[ "$nuevo_deposito" =~ ^[0-9]+$ ]]; then
            echo "Por favor, ingrese solo números."
        else
            monto_depositado=$(( ultimo_numero + nuevo_deposito ))
            echo "$monto_depositado Deposito -> ($nuevo_deposito)" >> "$my_database"    
        fi
        ;;

    2)
        read -p "Ingrese el monto a retirar (solamente el numero): " nuevo_retiro
        if ! [[ "$nuevo_retiro" =~ ^[0-9]+$ ]]; then
            echo "Por favor, ingrese solo números."
        else
            if [[ $nuevo_retiro -gt $ultimo_numero ]]; then
                echo "No posee suficientes fondos para realizar el retiro. Sus fondos son: $ultimo_numero "
            else
                monto_retirado=$(( ultimo_numero - nuevo_retiro ))
                echo "$monto_retirado Retiro -> ($nuevo_retiro)" >> "$my_database"
            fi    
        fi
        ;;

    
    3)
        echo "El saldo actual es de: "$ultimo_numero" "
        ;;
    
    4)
        echo "Salir"
        ;;

    *)
        echo "Opcion Invalida."
        ;;
esac
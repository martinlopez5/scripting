#!/bin/bash

#Funcion para detectar si es primo o no.
function es_primo {
    local num=$1
    if (( num <= 1 )); then
        return 1 #No es primo
    fi 
    for (( i = 2; i <= num / 2; i++ )); do
        if (( num % i == 0 )); then
            return 1 #No es primo
        fi
    done
    return 0 #Es primo
}

# Leer numero entero
read -p "Ingrese un numero entero: " numero_entero

# Verificar si el numero es entero
if ! [[ "$numero_entero" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Debes ingresar un número entero positivo."
    exit 1
fi

suma_primos=0

while (( numero_entero > 0 )); do
    digito=$(( numero_entero % 10 ))
    if es_primo $digito; then
        suma_primos=$(( suma_primos + digito ))
    fi
    numero_entero=$(( numero_entero / 10 ))
done

echo "La suma de los digitos pirmos del numero es: $suma_primos"



#!/bin/bash

read -p "Ingrese 3 numeros a sumar, separados por espacios: " num1 num2 num3
suma=$(($num1 + $num2 + $num3))
echo "La suma de los 3 numeros es: $suma "
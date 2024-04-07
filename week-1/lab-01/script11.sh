#!/bin/bash

mkdir -p mi_proyecto/documentos/ mi_proyecto/codigo/ mi_proyecto/codigo/utilidades/
touch mi_proyecto/documentos/plan.txt mi_proyecto/codigo/main.sh mi_proyecto/codigo/utilidades/funciones.sh
tree mi_proyecto >> mi_proyecto/documentos/plan.txt
cat mi_proyecto/documentos/plan.txt
echo "Hola, mundo!" >> mi_proyecto/codigo/main.sh
cat mi_proyecto/codigo/main.sh
echo "read -p 'Ingrese su nombre y apellido: ' nombre_apellido\necho \$nombre_apellido" >> mi_proyecto/codigo/utilidades/funciones.sh
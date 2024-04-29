#!/bin/bash


# Ingresar nombre de archivo
# Ingresar ruta donde se va a guardar el archivo

function create_file {
    read -p "Ingrese el nombre del archivo, sin extension, solo nombre: " file_name
    read -p "Ingrese la ruta donde va a guardar el archivo (ej: /home/margus/): " file_location

    if mkdir "$file_location"; then
        echo "La ruta '$file_location' fue creada con exito."
        touch $file_name $file_location
    else
        echo "La ruta no pudo crearse correctamente, por favor ingrese otra ruta."
    fi
}


function add_configuration {
    read -p "Ingrese el nombre del archivo al cual quiere agregar una configuracion: " file_name
    find /home/margus/ -type f -name "$file_name" 2> /dev/null
    
    read -p "Ingrese el nombre de la configuracion: " configuration_name
    read -p "Ingrese el valor de la configuracion: " configuration_valor

    if find "$file_name"; then
}


function delete_configuration {

}


function do_bkp {

}


function restore_bkp {

}


echo "MENU OPCIONES: "
echo "-------------------------------------------------------"
echo "1. Crear nuevo archivo de configuracion."
echo "2. Modificar configuracion existente."
echo "3. Eliminar configuracion existente."
echo "4. Listar todas las configuraciones."
echo "5. Buscar una configuracion por nombre."
echo "6. Realizar una copia de seguridad del archivo de configuracion."
echo "7. Restaurar una copia de seguridad."
echo "8. Salir."
echo "-------------------------------------------------------"

read -p "Ingrese la opcion deseada (1-8): " option

case $option in
    1)
        echo ""
        ;;
    
    2)
        echo ""
        ;;

    3)
        echo ""
        ;;

    4)
        echo ""
        ;;

    5)
        echo ""
        ;;

    6)
        echo "Saliendo del MENU...."
        exit 1
        ;;
    
    *)
        echo "Opcion Invalida"
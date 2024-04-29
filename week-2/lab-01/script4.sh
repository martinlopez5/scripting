#!/bin/bash

#    Construir un Programa que permita crear los artículos de una Ferretería (almacén donde se venden herramientas) de manera que cada una tenga un Código de Referencia,
#    Nombre, Descripción, Precio de Venta. Se necesita que el código de referencia de cada herramienta no pueda ser modificada desde otra clase.

# Codigo Referencia - Nombre - Descripcion - Precio de Venta

function create_item {
    read -p "Ingrese Nuevo Codigo de Referencia: " codigo_producto
    read -p "Ingrese Nuevo Nombre de Producto: " nombre_producto
    read -p "Ingrese una breve descripcion: " descripcion_producto
    read -p "Ingrese el precio de venta: " precio_producto
    busqueda_codigo=$(grep "^$codigo_producto" database_ferreteria.txt)
    if [[ -z "$busqueda_codigo" ]]; then
        echo -e "$codigo_producto" "$nombre_producto" "$descripcion_producto" "$precio_producto" >> database_ferreteria.txt
    else
        echo "El codigo "$codigo_producto" ya existe en la base de datos, por favor modifique el codigo con la opcion 2."
        echo -e "$codigo_producto" "$nombre_producto" "$descripcion_producto" "$precio_producto" >> database_ferreteria.txt
    fi
}

function modify_item {
    read -p "Ingrese el codigo de Referencia a modificar: " codigo_producto
    busqueda_codigo=$(grep "^$codigo_producto" database_ferreteria.txt)
    if [[ -z "$busqueda_codigo" ]]; then
        echo "El codigo "$busqueda_codigo" ingresado NO existe, por favor Cree un nuevo articulo."
    else
        echo "Se va a proceder a modificar el item con codigo "$busqueda_codigo"..."
        sed -i "/^$codigo_producto/d" database_ferreteria.txt
        echo "Ingrese los nuevos detalles del artículo:"
        read -p "Ingrese Nuevo Nombre de Producto: " nombre_producto
        read -p "Ingrese una breve descripcion: " descripcion_producto
        read -p "Ingrese el precio de venta: " precio_producto
        echo -e "$codigo_producto" "$nombre_producto" "$descripcion_producto" "$precio_producto" >> database_ferreteria.txt

    fi

}

function delete_item {
    read -p "Ingrese Codigo de Referencia a eliminar: " codigo_producto
    sed -i "/^$codigo_producto/d" database_ferreteria.txt
    busqueda_codigo=$(grep "^$codigo_producto" database_ferreteria.txt)
        if [[ $busqueda_codigo -eq 0 ]]; then
            echo "El codigo $codigo_producto fue eliminado correctamente."
        else
            echo "El codigo $codigo_producto NO pudo ser eliminado."
        fi
}

echo "MENU OPCIONES: "
echo "-------------------------------------------------------"
echo "1. Crear nuevo articulo."
echo "2. Modificar articulo existente."
echo "3. Eliminar articulo existente."
echo "4. Salir."
echo "-------------------------------------------------------"

read -p "Ingrese la opcion deseada (1-4): " option

case $option in
    1) 
        create_item
        ;;
    
    2)
        modify_item
        ;;
    
    3)
        delete_item
        ;;

    4)
        echo "Saliendo del programa."
        ;;

    *)
        echo "Opcion invalida."
        ;;

esac
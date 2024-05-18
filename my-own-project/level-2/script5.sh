#!/bin/bash

echo "MENU OPCIONES: "
echo "-------------------------------------------------------"
echo "1. Agregar un nuevo USUARIO."
echo "2. Modificar USUARIO existente."
echo "3. Eliminar USUARIO."
echo "4. Salir."
echo "-------------------------------------------------------"

read -p "Ingrese la opcion deseada (1-4): " option

case $option in 
    1)
        read -p "Ingrese el usuario a crear: " nombre_usuario
        read -p "Ingrese el nombre del usuario: " nombre
        read -p "Ingrese el Apellido del usuario: " apellido
        useradd -m -c "$nombre $apellido" -s /bin/bash "$nombre_usuario"
        passwd "$nombre_usuario"
        ;;
    
    2)
        read -p "Ingrese el usuario a MODIFICAR: " nombre_usuario
        if grep ":$nombre_usuario:" /etc/passwd >/dev/null; then
            # que valores modificar?
        else
            echo "El USUARIO "$nombre_usuario" NO existe."
            exit 1
        fi

    

    3)
        read -p "Ingrese el usuario a ELIMINAR: " nombre_usuario
        if grep ":$nombre_usuario:" /etc/passwd >/dev/null; then
            userdel -r $nombre_usuario
        else
            echo "El USUARIO "$nombre_usuario" NO existe."
        fi
        ;;    


    4)
        exit 1
        ;;

#!/bin/bash

# Colores ANSI
COLOR_ROJO="\e[31m"
COLOR_VERDE="\e[32m"
COLOR_AMARILLO="\e[33m"
COLOR_AZUL="\e[34m"
COLOR_MAGENTA="\e[35m"
COLOR_CYAN="\e[36m"
COLOR_BLANCO="\e[37m"
COLOR_RESET="\e[0m"

#Validando Usuario ROOT (de esta forma podes sacar el sudo)

if [ "$(id -u)" -ne 0 ]; then
    echo -e "${COLOR_ROJO}El Script debe ser ejecutado por un usuario ROOT${COLOR_RESET}"
fi

repositorio="bootcamp-devops-2023"
branch="clase2-linux-bash"
packages=("apache2" "git" "curl" "jq" "mariadb")

#Verificar si los paquetes estan instalados.

for package in "${packages[@]}"; do
    if ! dpkg -l "$package" 2> /dev/null; then
        echo -e "${COLOR_VERDE}Instalando "$package"${COLOR_RESET}"
        apt-get update
        apt install -y $package

        if [ $? -eq 0 ]; then
            echo -e "${COLOR_VERDE}El $package se instalo correctamente${COLOR_RESET}"
        else
            echo -e "${COLOR_ROJO}Error al Instalar el paquete "$package"${COLOR_RESET}"
            exit 1
        fi
    else
        echo -e "${COLOR_VERDE}El $package ya fue instalado${COLOR_RESET}"
    
    fi

done


#Condicional si existe repo
if [ -d "$REPO" ]; then
    echo -e "${COLOR_VERDE}El $REPO existe${COLOR_RESET}"
    cd $REPO && git pull
else
    echo -e "${COLOR_ROJO}El $REPO no existe${COLOR_RESET}"
    git clone .......
fi

cp -r $REPO/* /var/www/html

systemctl reload apache2

echo -e "${COLOR_VERDE}finalizado instalacion de WEB.....${COLOR_RESET}"


#Configure Database


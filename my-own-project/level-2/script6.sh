#!/bin/bash


packages=("apache2" "curl" "jq" "mysql-server" "php" "libapache2-mod-php" "php-mysql" "php-mbstring" "php-zip" "php-gd" "php-json" "php-curl")
apt-get update

for package in "${packages[@]}"; do
    if ! dpkg -l "$package" > /dev/null 2>&1; then
        echo -e "${COLOR_VERDE}Instalando "$package"${COLOR_RESET}"
        if apt-get install -y "$package"; then
            echo -e "${COLOR_VERDE}El $package se instaló correctamente${COLOR_RESET}"
        else
            echo -e "${COLOR_ROJO}Error al instalar el paquete $package${COLOR_RESET}"
            exit 1
        fi
    else
        echo -e "${COLOR_VERDE}El $package ya se encuentran instalado.${COLOR_RESET}"
    
    fi
done
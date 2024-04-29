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

repositorio="https://github.com/martinlopez5/scripting.git"
carpeta_repo="final-project/app-295devops-travel"
branch="main"
packages=("apache2" "git" "curl" "jq" "mariadb-server" "php" "libapache2-mod-php" "php-mysql" "php-mbstring" "php-zip" "php-gd" "php-json" "php-curl")

#Actualizar la lista de paquetes
apt-get update

#Verificar si los paquetes estan instalados.
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


#Clonacion del REPO
if [ -d "$carpeta_repo" ]; then
    echo -e "${COLOR_VERDE}El Repositorio "$carpeta_repo" existe${COLOR_RESET}"
    git pull && cd "$carpeta_repo"
else
    echo -e "${COLOR_ROJO}El REPOSITORIO no existe, clonando repositorio....${COLOR_RESET}"
    git clone -b $branch $repositorio
    cd "$carpeta_repo"
fi


#Configuracion de Database
systemctl start mariadb
systemctl enable mariadb

read -sp "Ingrese el password de la DB: " db_password

mysql <<EOF
CREATE DATABASE devopstravel;
CREATE USER 'codeuser'@'localhost' IDENTIFIED BY '$db_password';
GRANT ALL PRIVILEGES ON *.* TO 'codeuser'@'localhost';
FLUSH PRIVILEGES;
EOF

#sudo systemctl status mariadb

sleep 3

mysql < database/devopstravel.sql


#Configuracion de Apache2
echo "La version de PHP es: $(php -v)"
sleep 3
systemctl start apache2 
systemctl enable apache2 
#systemctl status apache2

pwd

sed -i "s/\(\$dbPassword\s*=\s*\).*;/\1\"$db_password\";/" config.php

modify_php="<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>"

echo "$modify_php" > /etc/apache2/mods-enabled/dir.conf

systemctl reload apache2

cp -r * /var/www/html/

curl localhost/info.php
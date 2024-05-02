#!/bin/bash

# Actualiza el sistema e instala las herramientas necesarias
sudo apt-get update
sudo apt-get install -y unzip python3-pip


## Instala Terraform
#TERRAFORM_VERSION="1.5.7"  # Cambia la versión de Terraform según sea necesario
#wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
#unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
#sudo mv terraform /usr/local/bin/
#rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
#
## Instala Ansible
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python3 get-pip.py
#python3 -m pip install ansible
#
## Instala Docker
#curl -fsSl https://get.docker.com -o get-docker.sh
#sudo sh get-docker.sh
#
## Usa Docker sin sudo
#sudo groupadd docker
#sudo usermod -aG docker vagrant
#newgrp docker
#
## Instala Jenkins
#sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
#  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
#echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
#  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#  /etc/apt/sources.list.d/jenkins.list > /dev/null
#sudo apt-get update
#sudo apt-get install jenkins
#
## Jenkins utiliza Docker
#sudo usermod -aG docker jenkins
#
## Instala Java
#sudo apt-get install openjdk-11-jdk
#
## Instala Minikube
#curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
#sudo dpkg -i minikube_latest_amd64.deb
#rm minikube_latest_amd64.deb
#
## Instala kubectl
#sudo apt-get install -y kubectl


##Clonar Repo, con archivos Terraform y Ansible
# git clone REPO
# 
##Copiar archivo .tfvars a carpeta Terraform
# sudo cp /vagrant/terraform.tfvars /home/vagrant/desafio-M13/Terraform
# sudo cp /vagrant/keypair-modulo13.pem /home/vagrant/desafio-M13/Terraform
# 
##Permisos KEY.pem
# sudo chmod 777 /home/vagrant/desafio-M13/Terraform/keypair-modulo13.pem
#!/bin/bash

# Mise à jour du système
echo "Mise à jour du système..."
sudo apt-get update && sudo apt-get upgrade -y

# Installation des dépendances
echo "Installation des dépendances..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Ajout de la clé GPG officielle de Docker
echo "Ajout de la clé GPG de Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Ajout du repository Docker
echo "Ajout du repository Docker..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Mise à jour de la liste des paquets
sudo apt-get update

# Installation de Docker
echo "Installation de Docker..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Installation de Docker Compose
echo "Installation de Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Ajout de l'utilisateur courant au groupe docker
echo "Ajout de l'utilisateur au groupe docker..."
sudo usermod -aG docker $USER

# Configuration de la mémoire du système
echo "Configuration de la mémoire du système..."
# Augmentation de la taille du swap (exemple : 4G)
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1G count=4
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Ajustement des paramètres du noyau pour Docker
echo "Ajustement des paramètres du noyau..."
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "Installation terminée. Veuillez redémarrer votre système pour appliquer tous les changements."

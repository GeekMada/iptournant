# Projet de Proxy avec Docker

Ce projet configure un proxy reverse avec gestion de cache et rotation d'IP en utilisant Docker. Il comprend également un script d'installation pour préparer l'environnement.

## Contenu du projet

1. `docker-compose.yml` : Configuration Docker Compose
2. `install_docker.sh` : Script d'installation de Docker et configuration système
3. `nginx.conf` : Configuration de NGINX (à créer)

## Détails des fichiers

### 1. docker-compose.yml

Ce fichier définit deux services Docker :

- `nginx_proxy` : Un proxy reverse NGINX avec gestion de cache.
- `ip-rotator` : Un service qui change périodiquement l'adresse IP.

#### Points clés :
- Utilise NGINX comme proxy reverse
- Configure un volume pour le cache NGINX
- Définit des limites de mémoire pour le conteneur
- Permet la rotation des IP

### 2. install_docker.sh

Un script bash qui prépare le système pour exécuter Docker :

- Met à jour le système
- Installe Docker et Docker Compose
- Configure la mémoire du système (y compris le swap)
- Ajuste les paramètres du noyau pour optimiser Docker

#### Utilisation :
```bash
chmod +x install_docker.sh
sudo ./install_docker.sh
```

**Note** : Redémarrez le système après l'exécution du script.

### 3. nginx.conf (à créer)

Ce fichier doit être créé pour configurer NGINX comme proxy reverse avec cache.

## Installation et configuration

1. Exécutez le script d'installation :
   ```
   sudo ./install_docker.sh
   ```

2. Créez le fichier `nginx.conf` avec la configuration appropriée pour votre proxy NGINX.

3. Lancez les services avec Docker Compose :
   ```
   docker-compose up -d
   ```

## Personnalisation

- Modifiez `docker-compose.yml` pour ajuster les limites de mémoire ou le temps de rotation des IP.
- Personnalisez `nginx.conf` selon vos besoins spécifiques en matière de proxy et de cache.

## Maintenance

- Surveillez l'utilisation des ressources avec `docker stats`.
- Vérifiez les logs NGINX avec `docker-compose logs nginx_proxy`.

## Sécurité

- Assurez-vous de sécuriser votre configuration NGINX.
- Mettez régulièrement à jour Docker et les images utilisées.

Pour toute question ou problème, n'hésitez pas à consulter la documentation Docker ou à demander de l'aide.

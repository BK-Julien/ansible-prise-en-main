--- FICHIER ansible.cfg
Configuration Ansible - Paramètres Clés
Présentation Générale
Ce fichier de configuration (ansible.cfg) définit des paramètres globaux pour l'environnement Ansible, optimisant le déploiement et l'exécution des playbooks dans notre infrastructure.
Configuration Principale
Interpréteur Python
    interpreter_python=/usr/bin/python3.12
        Spécifie explicitement l'interpréteur Python 3.12 à utiliser
        Garantit la compatibilité et évite les problèmes de résolution d'environnement

Gestion de l'Inventaire
    inventory=./inventory/development.ini
        Pointe vers le fichier d'inventaire pour l'environnement de développement
        Permet une organisation claire des ressources par environnement

Connexion Distante
    remote_user=lab
        Utilisateur par défaut pour les connexions aux serveurs distants
    ask_pass=true
        Demande systématiquement le mot de passe de connexion
    host_key_checking=false
        Désactive la vérification des clés d'hôte (à utiliser avec précaution)

Paramètres de Performance
    forks=2
        Limite le nombre de connexions parallèles simultanées
        Réduit la charge réseau et système

Notifications
    deprecation_warnings=false
        Supprime les avertissements de dépréciation

Escalade de Privilèges
Configuration Sudo
    become=true
        Active l'escalade de privilèges
    become_user=root
        Définit root comme utilisateur cible pour l'escalade
    become_ask_pass=true
        Demande le mot de passe sudo
    become_method=sudo
        Utilise sudo comme méthode d'escalade

--FICHIER inventory:development.ini

Configuration de l'Inventaire Ansible - Inventaire de Développement

Présentation Générale

Le fichier development.ini définit l'inventaire des hôtes pour l'environnement de développement, permettant une gestion centralisée et organisée des ressources.

Structure de l'Inventaire

Groupe Kubernetes
    [clusterk8s] : Un groupe logique regroupant les hôtes d'un cluster Kubernetes

Définition des Hôtes
    host1
        Adresse IP : 192.168.1.12
        Identifiant de référence dans les playbooks Ansible
    host2
        Adresse IP : 192.168.1.13
        Second nœud du cluster

Paramètres Clés
    ansible_host : Spécifie l'adresse IP de connexion pour chaque hôte
    Format : nom_hôte ansible_host=adresse_ip

#!/bin/bash

# Mot de passe par défaut
DEFAULT_PASSWORD="MotDePasse123!"

# Création de 100 utilisateurs
for i in $(seq -w 1 100); do
    USERNAME="user$i"

    # Créer l'utilisateur sans invite
    useradd -m -s /bin/bash "$USERNAME"

    # Ajouter l'utilisateur au groupe wheel
    usermod -aG wheel "$USERNAME"

    # Définir un mot de passe par défaut
    echo "$USERNAME:$DEFAULT_PASSWORD" | chpasswd

    # Forcer le changement de mot de passe à la première connexion
    chage -d 0 "$USERNAME"

    echo "Utilisateur $USERNAME créé avec succès."
done

echo "Création des utilisateurs terminée !"


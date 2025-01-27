#!/bin/bash

# Supprimer les 100 utilisateurs
for i in $(seq -w 1 100); do
    USERNAME="user$i"

    # Vérifier si l'utilisateur existe avant de le supprimer
    if id "$USERNAME" &>/dev/null; then
        # Supprimer l'utilisateur et son répertoire personnel
        userdel -r "$USERNAME"
        echo "Utilisateur $USERNAME supprimé avec succès."
    else
        echo "Utilisateur $USERNAME n'existe pas."
    fi
done

echo "Suppression des utilisateurs terminée !"


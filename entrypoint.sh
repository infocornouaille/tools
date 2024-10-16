#!/bin/bash
set -e

# Fonction pour vérifier si une commande existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Vérifie la première commande passée
if command_exists "$1"; then
    exec "$@"
elif [ "$1" = "pandoc" ] || [ "$1" = "python" ]; then
    # Si la commande est pandoc ou python, on l'exécute directement
    "$@"
else
    echo "Commande non reconnue. Commandes disponibles : pandoc, python"
    exit 1
fi
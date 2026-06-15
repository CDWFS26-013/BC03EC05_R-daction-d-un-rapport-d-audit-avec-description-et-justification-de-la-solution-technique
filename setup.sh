#!/bin/bash

set -e

echo "=== Gestionnaire de Cloud Local ==="
echo "1) Créer une ressource"
echo "2) Supprimer une ressource"
read -p "Choix : " action

if [[ "$action" == "2" ]]; then
    echo "=== Suppression d'une ressource ==="
    read -p "Type de ressource à supprimer (vm/db) : " resource_type
    read -p "Nom/identifiant de la ressource : " resource_name

    case "$resource_type" in
        vm)
            echo "Suppression de la VM '$resource_name'..."
            docker rm -f "$resource_name" 2>/dev/null && echo "VM supprimée." || echo "Erreur : VM introuvable."
            ;;
        db)
            echo "Suppression de l'instance de base de données '$resource_name'..."
            docker rm -f "$resource_name" 2>/dev/null && echo "Instance supprimée." || echo "Erreur : instance introuvable."
            ;;
        *)
            echo "Type de ressource inconnu."
            exit 1
            ;;
    esac

    exit 0
fi

if [[ "$action" != "1" ]]; then
    echo "Choix invalide."
    exit 1
fi

read -p "Souhaitez-vous créer une nouvelle VM ? (o/n) : " create_vm

if [[ "$create_vm" == "o" || "$create_vm" == "O" ]]; then
    read -p "Système d'exploitation (ubuntu/arch) : " os
    read -p "CPU max (en shares, ex: 1024) : " cpu_max
    read -p "RAM max (en Mo, ex: 512) : " ram_max
    read -p "Chemin vers la clé publique SSH : " ssh_key_path
    read -p "Nom d'utilisateur : " username
    read -sp "Mot de passe : " password
    echo ""

    if [[ ! -f "$ssh_key_path" ]]; then
        echo "Erreur : le fichier de clé publique n'existe pas."
        exit 1
    fi

    public_key=$(cat "$ssh_key_path")

    echo ""
    echo "Récapitulatif de la demande de création :"
    echo "  OS        : $os"
    echo "  CPU max   : $cpu_max"
    echo "  RAM max   : $ram_max"
    echo "  Clé pub.  : $ssh_key_path"
    echo "  Username  : $username"
fi

read -p "Souhaitez-vous créer une instance de base de données ? (o/n) : " create_db

if [[ "$create_db" == "o" || "$create_db" == "O" ]]; then
    read -p "Type de moteur (postgres/mariadb) : " db_engine
    read -p "Nom d'utilisateur de la base de données : " db_username
    read -sp "Mot de passe de la base de données : " db_password
    echo ""

    if [[ "$db_engine" != "postgres" && "$db_engine" != "mariadb" ]]; then
        echo "Erreur : moteur non supporté. Choisissez 'postgres' ou 'mariadb'."
        exit 1
    fi

    echo ""
    echo "Récapitulatif de la demande de base de données :"
    echo "  Moteur    : $db_engine"
    echo "  Username  : $db_username"
fi
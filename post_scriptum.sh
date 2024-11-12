#!/bin/bash

# Déclaration des variables

adresse_ip=""
nom_utilisateur=""

#Menu information utilitsateur 

menu_information_utilisateur()
{ 

echo "Menu information utilisateur" 
echo "1) Droits/Permissions de l'utilisateur sur un dossier" 
echo "2) Droits/Permissions de l'utilisateur sur un fichier"
echo "3) Date de dernière connexion d'un utilisateur"
echo "4) Date de dernière modification du mot de passe de l'utilisateur" 
echo "5) Liste des sessions ouvertes par l'utilisateur"
echo "6) Liste des utilisateurs locaux"
echo "r) Retour au menu Précédent"
echo "x) Retour au Menu Principal"
read -p "Quel est votre choix ?" choix_information_utilisateur 

        case $choix_information_utilisateur in 

        1) echo "Droits/Permissions de l'utilisateur sur un dossier" 
        echo "Quel dossier vous séléctionner ?" read -p $directory      
        getfacl $directory | grep user;;

        2) echo "Droits/Permissions de l'utilisateur sur un fichier"
        echo"Quel fichier voulez vous sélectionner ?" read -p  $file
        getfacl $file | grep user;;

        3) echo "Date de dernière connexion d'un utilisateur"
        last $nom_utilisateur;;

        4) echo "Date de dernière modification du mot de passe de l'utilisateur"
        passwd $nom_utilisateur -S;;

        5) echo "Liste des sessions ouvertes par l'utilisateur"
        w;;

        6) echo "Liste des utilisateurs locaux"
        cut -d: -f1 /etc/passwd;;

        r) echo "Retour au Menu Précédent"
           menu_information;;

        x) echo "Retour au Menu Principal"
           menu_principal;;
           
esac
}

#menu information système 

menu_information_systeme() 
{

echo "Menu Information Système"

echo "1) Informations du processeur :"
echo "2) Mémoire RAM Totale"
echo "3) Utilisation de la RAM"
echo "4) Utilisation du processeur"
echo "5) Utilisation du disque"
echo "6) La version du système d'exploitation"
echo "7) Liste des applications installées"
echo "r) Retour au Menu Précédent"
echo "x) Retour au Menu Principal"
read -p  "Quel est votre choix ?" choix_information_system

case $choix_information_system in 

        1)      echo "Informations du CPU ( type de processeur)"
                lscpu;;

        2)      echo "Mémoire RAM totale"
                cat /proc/meminfo;;

        3)      echo "Utilisation de la RAM" 
                free;;

        4)      echo "Utilisation du processeur"
                top;;

        5)      echo "Utilisation du disque"
                lsblk -f;;

        6)      echo "Version de l'OS :"
                lsb_release -a ;; 

        7)      echo "Liste des applications installées :"
                sudo dpkg -l;;

        r)      echo "Retour au Menu Précédent"
                menu_information;;

        x)      echo "Retour au Menu Principal" 
                menu_principal;;

esac
}

menu_information_utilisateur

menu_information_systeme






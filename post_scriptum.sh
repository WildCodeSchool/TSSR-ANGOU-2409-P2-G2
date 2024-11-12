#!/bin/bash

# Déclaration des variables

adresse_ip=""
nom_utilisateur=""

# Fonctions pour le menu Action - Comptes et Utilisateurs


function creation_compte_utilisateur () {

    read -p "Nom de l'utilisateur dont le compte doit être créer ? " user_account
    echo "$(date) - Création du mot de passe pour l'utilisateur $user_account" >> /var/log/log_evt.log 
    ssh $nom_utilisateur@$adresse_ip "sudo -S useradd -m $user_account"
    echo "Mot de passe créé pour l'utilisateur $user_account"
}


function changement_mot_de_passe_utilisateur () {

    read -p "Nom de l'utilisateur dont le mot de passe doit être changer ? " user_passwd
    echo "$(date) - Modification du mot de passe pour l'utilisateur $user_account" >> /var/log/log_evt.log
    ssh $nom_utilisateur@$adresse_ip "sudo -S chpasswd $user_passwd" 
    echo "Mot de passe changé pour l'utilisateur $user_passwd"
}

function Suppression_de_compte_utilisateur_local () {

    read -p "Nom de l'utilisateur dont le compte doit être supprimmé ? " del_user_local_account
    echo "Suppression du compte de l'utilisateur local $del_user_local_account" >> /var/log/log_evt.log
    ssh $nom_utilisateur@$adresse_ip  "sudo -S deluser $del_user_local_account"
    echo "Suppression avec succès du compte pour l'utilisateur $del_user_local_account"

}


function Ajout_utilisateur_au_groupe_administrateur () {

    read -p "Nom de l'utilisateur qui doit être ajouté au groupe administrateur ? " add_user_to_admin
    echo "Ajout de l'utilisateur $add_user_to_admin au groupe administrateur" >l> /var/log/og_evt.log
    ssh $nom_utilisateur@$adresse_ip  "sudo -S usermod -aG sudo "$add_user_to_admin""
    echo "Ajout avec succès de l'utilisateur $add_user_to_admin au groupe administrateur"

}



function ajout_utilisateur_a_un_groupe_local () {
    
    read -p "Nom de l'utilisateur qui doit être ajouté au groupe utilisateur local ? " add_user_to_local_users
    echo "Ajout de l'utilisateur $add_user_to_local_users au groupe local" >l> /var/log/og_evt.log
    ssh $nom_utilisateur@$adresse_ip  "sudo -S usermod -aG users "$add_user_to_local_users""
    echo "Ajout avec succès de l'utilisateur $add_user_to_local_users au groupe utilisateur local"
}

function sortie_utilisateur_a_un_groupe_local () {

    read -p "Nom de l'utilisateur qui doit sortir du groupe utilisateur local ? " del_user_to_local_users
    echo "sortie de l'utilisateur $del_user_to_local_users au groupe local" >l> /var/log/og_evt.log
    ssh $nom_utilisateur@$adresse_ip  "sudo -S deluser "$add_user_to_local_users" users"
    echo "Suppression avec succès de l'utilisateur $del_user_to_local_users du groupe utilisateur local"

}


# Menu action comptes et utilsateurs


while true; do
clear
echo "Menu action comptes et utilsateurs :"
echo "----------------------------------"
echo "1- Création de compte utilisateur local"
echo "2- Changement de mot de passe utilisateur"
echo "3- Suppression de compte utilisateur local"
echo "4- Ajout utilisateur à un groupe administrateur"
echo "5- Ajout utilisateur à un groupe local"
echo "6- Sortie utilisateur de groupe local"
echo "7- Retour au menu précédent"
echo "8- Retour au menu principal"
read -p "Votre choix ? :" rep1

case $rep1 in
    1) creation_compte_utilisateur;;
    2) changement_mot_de_passe_utilisateur;;
    3) Suppression_de_compte_utilisateur_local ;;
    4) ajout_utilisateur_au_groupe_administrateur;;
    5) ajout_utilisateur_a_un_groupe_local ;;
    6) sortie_utilisateur_a_un_groupe_local ;;            
    7) echo "Retour au menu précédent" ;;
    8) echo "Retour au menu principal" ;;
    *) echo "Erreur choix non valide merci de modifier votre choix" ;;
esac
done


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
        getfacl $directory | grep user

        2) echo "Droits/Permissions de l'utilisateur sur un fichier"
        echo"Quel fichier voulez vous sélectionner ?" read -p  $file
        getfacl $file | grep user

        3) echo "Date de dernière connexion d'un utilisateur"
        last $nom_utilisateur 

        4) echo "Date de dernière modification du mot de passe de l'utilisateur"
        passwd $nom_utilisateur -S

        5) echo "Liste des sessions ouvertes par l'utilisateur"
        w

        6) echo "Liste des utilisateurs locaux"
        cut -d: -f1 /etc/passwd

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






#!/bin/bash

# Déclaration des variables

adresse_ip=""
nom_utilisateur=""

<
menu_securite(){
echo "Menu Sécurité"
echo "1) Statut du Pare-Feu"
echo "2) Liste des Ports Ouverts"
echo "r) Retour au Menu Précédent"
echo "x) Retour au Menu Principal"
echo "q) Sorti Script"
read -p "faites votre choix :" choix_securite
case $choix_securite in

		1)
			sudo ufw status
			echo "$USER $(date) à Afficher le status du Pare-feu" >> /var/log/log_evt.log
			menu_securite;;
			
		2)
			ss -tulpn
                	echo "$USER $(date) à effectuer l'action Affichage liste ports ouvert" >> /var/log/log_evt.log
			menu_securite;;

		r)
			echo "retour au menu précédent"
			echo "$USER $(date) est Retourner au Menu Précédent" >> /var/log/log_evt.log
			menu_information;;

		x)
			echo "Retour au Menu Principal"
			echo "$USER $(date) est Retourner au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;

		q)
			exit
			echo "$USER $(date) est sorti du script" >> /var/log/log_evt.log
			;;
			

		*)
			echo "mauvaise commande veuillez réesayer"
			echo "$USER $(date) à Utiliser une mauvaise commande" >> /var/log/log_evt.log 
			menu_securite;;

esac
} 
menu_journalisation(){
echo "Menu Journalisation"
echo "1) Recherche des événements dans le fichier log_evt.log par utilisateur"
echo "2) Affichage des événements éffectuer sur l'Ordinateur"
echo "r) Retour au Menu Précédent"
echo "x) Retour au Menu Principal"
echo "q) Sorti Script"
read -p "faites votre choix :" choix_journalisation
case $choix_journalisation in

		1)
			read -p "Entré le nom d'utilisateur :" utilisateur
			cat /var/log/log_evt.log | grep "$utilisateur"
			echo "$USER $(date) à Rechercher des événements éffectuer par $utilisateur" >> /var/log/log_evt.log 
			menu_journalisation;;

		2)
			cat /var/log/log_evt.log
			echo "$USER $(date) à éffectuer l'action Affichage des événement de l'Ordinateur" >> /var/log/log_evt.log 
			menu_journalisation;;

		r)
			echo "Retour au Menu Précédent"
			echo "$USER $(date) est Retourner au Menu Précédent" >> /var/log/log_evt.log
			menu_information;;

		x)
			echo "Retour au Menu Principal"
			echo "$USER $(date) est Retourner au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;

		q)
			exit
			echo "$USER $(date) est sorti du script" >> /var/log/log_evt.log
			;;

		 *)
                        echo "mauvaise commande veuillez réesayer"
                        echo "$USER $(date) à Utiliser une mauvaise commande" >> /var/log/log_evt.log 
                        menu_journalisation;;

esac
}
menu_reseaux(){

echo "Menu Réseaux"

echo "1) Affichage adresse mac"
echo "2) Nombre d'interface réseaux"
echo "3) Affichage adresse IP"
echo "4) Affichage liste ports ouvert"
echo "r) Retour au Menu Précédent"
echo "x) Retour au Menu Principal"
echo "q) Sorti Script"
read -p "faites votre choix :" choix_reseaux
case $choix_reseaux in

		1)
			ip a | grep link/ether | cut -d\  -f 6
			echo "$USER $(date) à effectuer l'action Affichage de l'adresse mac" >> /var/log/log_evt.log
			menu_reseaux;;

		2)
			ls /sys/class/net/ | wc -l
			echo "$USER $(date) à effectuer l'action Affichage du nombre d'interface réseaux" >> /var/log/log_evt.log
			menu_reseaux;;

		3)
			ip a | grep inet | cut -d\  -f 6
			echo "$USER $(date) à effectuer l'action Affichage adresse IP" >> /var/log/log_evt.log
			menu_reseaux;;

		4)
			ss -tulpn
			echo "$USER $(date) à effectuer l'action Affichage liste ports ouvert" >> /var/log/log_evt.log
			menu_reseaux;;

		r)
			echo "retour au menu précédent"
			echo "$USER $(date) est Retourner au Menu Précédent" >> /var/log/log_evt.log
			menu_information;;

		x)
			echo "Retour au Menu Principal"
			echo "$USER $(date) est Retourner au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;
		q)
			exit
			echo "$USER $(date) est sorti du script" >> /var/log/log_evt.log
			;;
			
		*)
			echo "mauvaise commande veuillez réesayer"
			echo "$USER $(date) à Utiliser une mauvaise commande" >> /var/log/log_evt.log 
			menu_réseaux;;

esac
}
menu_information(){

echo "Menu Information"
echo "1) Menu Information Compte / Utilisateurs"
echo "2) Menu Information Réseaux"
echo "3) Menu système"
echo "4) Menu sécurité"
echo "5) Consulter le journal des événements"
echo "x) Retour au Menu principal"
echo "q) Sorti Script"
read -p "A qu'elle menu voulez vous accéder :" choix_menu
case $choix_menu in

		1)
			echo "Ouverture Menu Information Compte / Utilisateurs"
			echo "$USER $(date) à Sélectionner le Menu Information Compte / Utilisateur" >> /var/log/log_evt.log
			menu_compte;;

		2)
			echo "Ouverture Menu Réseaux"
			echo "$USER $(date) à Sélectionner le Menu Réseaux" >> /var/log/log_evt.log
			menu_reseaux;;

		3)
			echo "Ouverture Menu système"
			echo "$USER $(date) à Sélectionner le Menu Système" >> /var/log/log_evt.log
			menu_système;;

		4)
			echo "Ouverture Menu sécurité"
			echo "$USER $(date) à Sélectionner le Menu Sécurité" >> /var/log/log_evt.log
			menu_securite;;

		5)
			echo "Ouverture Menu Journalisation"
			echo "$USER $(date) à choisi de Conulter le journal des évenements" >> /var/log/log_evt.log
			menu_journalisation;;

		x)
			echo "Retour au Menu Principal"
			echo "$USER $(date) est Retourner au Menu Principal" >> /var/log/log_evt.log
			menu_principale;;
			
		q)
			exit
			echo "$USER $(date) est sorti du script" >> /var/log/log_evt.log
			;;
			
		*)
			echo "mauvaise commande veuillez réesayer"
			echo "$USER $(date) à Utiliser une mauvaise commande" >> /var/log/log_evt.log 
			menu_information;;

esac
}

# Menu et fonctions pour : Action - Comptes et Utilisateurs


function action_comptes_utilisateurs () {

read -p "Nom de l'utilisateur dont le compte doit être créer ? " user_account
echo "$date - Création du mot de passe pour l'utilisateur $user_account" >> /var/log/log_evt.log 



    # Fonctions pour le menu Action - Comptes et Utilisateurs


    function creation_compte_utilisateur () {

        read -p "Nom de l'utilisateur dont le compte doit être créé? " user_account
        echo "$(date) - Création du mot de passe pour l'utilisateur $user_account" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S useradd -m $user_account"
        echo "Mot de passe créé pour l'utilisateur $user_account"
        sleep 2
    }   


    function changement_mot_de_passe_utilisateur () {

        read -p "Nom de l'utilisateur dont le mot de passe doit être changer ? " user_passwd
        echo "$(date) - Modification du mot de passe pour l'utilisateur $user_passwd" >> /var/log/log_evt.log
        ssh $nom_utilisateur@$adresse_ip "sudo -S chpasswd $user_passwd" 
        echo "Mot de passe changé pour l'utilisateur $user_passwd"
        sleep 2
    }

    function Suppression_de_compte_utilisateur_local () {

        read -p "Nom de l'utilisateur dont le compte doit être supprimmé ? " del_user_local_account
        echo "Suppression du compte de l'utilisateur local $del_user_local_account" >> /var/log/log_evt.log
        ssh $nom_utilisateur@$adresse_ip  "sudo -S deluser $del_user_local_account"
        echo "Suppression avec succès du compte pour l'utilisateur $del_user_local_account"
        sleep 2

    }


    function Ajout_utilisateur_au_groupe_administrateur () {

        read -p "Nom de l'utilisateur qui doit être ajouté au groupe administrateur ? " add_user_to_admin
        echo "Ajout de l'utilisateur $add_user_to_admin au groupe administrateur" >l> /var/log/og_evt.log
        ssh $nom_utilisateur@$adresse_ip  "sudo -S usermod -aG sudo "$add_user_to_admin""
        echo "Ajout avec succès de l'utilisateur $add_user_to_admin au groupe administrateur"
        sleep 2

    }



    function ajout_utilisateur_a_un_groupe_local () {
        
        read -p "Nom de l'utilisateur qui doit être ajouté au groupe utilisateur local ? " add_user_to_local_users
        echo "Ajout de l'utilisateur $add_user_to_local_users au groupe local" >l> /var/log/og_evt.log
        ssh $nom_utilisateur@$adresse_ip  "sudo -S usermod -aG users "$add_user_to_local_users""
        echo "Ajout avec succès de l'utilisateur $add_user_to_local_users au groupe utilisateur local"
        sleep 2
    }

    function sortie_utilisateur_a_un_groupe_local () {

        read -p "Nom de l'utilisateur qui doit sortir du groupe utilisateur local ? " del_user_to_local_users
        echo "sortie de l'utilisateur $del_user_to_local_users au groupe local" >l> /var/log/og_evt.log
        ssh $nom_utilisateur@$adresse_ip  "sudo -S deluser "$del_user_to_local_users" users"
        echo "Suppression avec succès de l'utilisateur $del_user_to_local_users du groupe utilisateur local"
        sleep 2

    }

    # Menu action comptes et utilisateurs


    while true; do
    clear
    echo "Menu Action comptes et utilisateurs :"
    echo "----------------------------------"
    echo "1- Création de compte utilisateur local"
    echo "2- Changement de mot de passe utilisateur"
    echo "3- Suppression de compte utilisateur local"
    echo "4- Ajout utilisateur à un groupe administrateur"
    echo "5- Ajout utilisateur à un groupe local"
    echo "6- Sortie utilisateur de groupe local"
    echo "r- Retour au menu précédent"
    echo "x- Retour au menu principal"
    read -p "Votre choix ? :" repcmu

        case $repcmu in
            1) creation_compte_utilisateur ;;
            2) changement_mot_de_passe_utilisateur ;;
            3) Suppression_de_compte_utilisateur_local ;;
            4) ajout_utilisateur_au_groupe_administrateur;;
            5) ajout_utilisateur_a_un_groupe_local ;;
            6) sortie_utilisateur_a_un_groupe_local ;;            
            r) echo "Retour au menu précédent" ;;
            x) echo "Retour au menu principal" ; menu_principal ;;
            *) echo "Erreur choix non valide merci de modifier votre choix" ;; 
            
            
        esac

        sleep 2

    done


}



# Menu et fonctions pour : Action - Système


function action_systeme() {



    # Fonctions pour le menu Action - Système


    function creation_repertoire () {

        read -p "Nom du repertoire à créer (En Chemin absolu) ? " mkdir_name
        echo "$(date +"%d/%m/%Y à %Hh%M") - $USER - Création du repertoire $mkdir_name" >> /var/log/log_evt.log
        sudo -S mkdir -v $mkdir_name
        # ssh $nom_utilisateur@$adresse_ip "sudo -S mkdir -v $mkdir_name"
        # echo "Repertoire $mkdir_name créé "
        sleep 2
    }


    function suppression_repertoire () {

        read -p "Nom du repertoire à supprimer (En Chemin absolu) ? " del_dir_name
        echo "$(date) - Supression du repertoire $del_dir_name" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S rm -r -v $del_dir_name"
        # echo "Repertoire $del_dir_name supprimé "
        sleep 2
    }


    function  installation_logiciel () {

        read -p "Nom du package à installer ? " install_soft
        echo "$(date) - Installation du package $install_soft" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S apt-get install $install_soft -y"
        echo "Package $install_soft installé "
        sleep 2
    }



    function  desinstallation_logiciel () {

        read -p "Nom du package à installer ? " desinstall_soft
        echo "$(date) - Desinstallation du package $desinstall_soft" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S apt remove $desinstall_soft -y"
        echo "Package $desinstall_soft desinstallé "
        sleep 2
    }


    function  execution_script () {

        read -p "Nom du script à lancer ? " exec_script
        echo "$(date) - Execution du script $exec_script" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -yes | ./$exec_script -y"
        echo "Script $exec_script lancé "
        sleep 2
    }


    function  verrouillage_machine () {

        Echo "Verrouillage de la machine" 
        echo "$(date) - Verrouillage de  la machine  : $adresse_ip" >> /var/log/log_evt.log
        sleep 2 
        ssh $nom_utilisateur@$adresse_ip "sudo -S systemctl suspend"
    }


    function  redemarrage_machine () {

        Echo "Redémarrage de la machine" 
        echo "$(date) - Redémarrage de la machine : $adresse_ip" >> /var/log/log_evt.log
        sleep 2 
        ssh $nom_utilisateur@$adresse_ip "sudo -S reboot"
    }


    function  arret_machine () {

        Echo "Arrêt de la machine" 
        echo "$(date) - Arrêt de la machine : $adresse_ip" >> /var/log/log_evt.log
        sleep 2 
        ssh $nom_utilisateur@$adresse_ip "sudo -S shutdown now"
    }


    function  update_machine () {

        Echo "Mise à jour du système de la machine" 
        echo "$(date) - Mise à jour du système : $adresse_ip" >> /var/log/log_evt.log
        ssh $nom_utilisateur@$adresse_ip "sudo -S apt update && apt upgrade -y"
        echo "Système mis à jour "
        sleep 2
    }



    # Menu système

    while true; do
    clear
    echo "Menu Action système :"
    echo "---------------------"
    echo "1- Création de répertoire"
    echo "2- Suppression de répertoire"
    echo "3- Installation de logiciel (distribution Linux Ubuntu)"
    echo "4- Désinstallation de logiciel (distribution Linux Ubuntu)"
    echo "5- Execution de script sur une machine distante"
    echo "6- Verrouillage de la machine"
    echo "7- Redémarrage de la machine"
    echo "8- Arrêt de la machine"
    echo "9- Mise à jour du système de la machine"
    echo "r- Retour au menu précédent"
    echo "x- Retour au menu principal"
    read -p "Votre choix ? :" reps

        case $reps in
            1) creation_repertoire ;;
            2) suppression_repertoire ;;
            3) installation_logiciel ;;
            4) desinstallation_logiciel ;;
            5) execution_script ;;
            6) verrouillage_machine ;;            
            7) redemarrage_machine ;;
            8) arret_machine ;;
            9) update_machine ;;
            r) echo "Retour au menu précédent" ;;
            x) echo "Retour au menu principal" ; menu_principal ;;
            *) echo "Erreur choix non valide merci de modifier votre choix" ;; 
            
            
        esac

        sleep 2
    done


}



function  menu_principal () {

while true; do
clear
echo "==========================="
echo "      Menu principal       "
echo "==========================="
echo "1. Menu Action - Comptes et utilisateurs"
echo "2. Menu Action - Système"
echo "x. Quitter"
read -p "Votre choix ?"  choice
case $choice in
    1) action_comptes_utilisateurs ;;
    2) action_systeme ;;
    x) clear ;echo "fin du script";sleep 3 ;clear ; exit  ;;
    *) echo "Mauvais choix, veuillez réessayer" ;;
esac

sleep 2

done

}

menu_principal

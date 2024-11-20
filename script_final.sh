#!/bin/bash
#Les lignes dans chaque fonctions correspondant à :
# echo $(<comande>) >> $nom_fichier_texte.txt
# permettent d'inscrire les informations recuillis sur la machine client dans un fichier portant le nom de l'utilisateur dans ~/Documents
#
#Menu information utilitsateur 


# Fonction de fin du script : Restreint les droits d'accès en écriture au fichier de journalisation du fichier log_evt.log et son chemin à leur statut d'origine et quitte le script
sortie_script () {

	sudo chmod 644 /var/log/log_evt.log
	sudo chmod 644 /var/log
	sudo chmod 644 /var
 	exit 0
}

menu_information_utilisateur()
{ 
clear
echo "Menu information utilisateur" 
echo "1) Droits/Permissions de l'utilisateur sur un dossier" 
echo "2) Droits/Permissions de l'utilisateur sur un fichier"
echo "3) Date de dernière connexion d'un utilisateur"
echo "4) Date de dernière modification du mot de passe de l'utilisateur" 
echo "5) Liste des sessions ouvertes par l'utilisateur"
echo "6) Liste des utilisateurs locaux"
echo "r) Retour au menu Précédent"
echo "x) Retour au Menu Principal"
echo "q) Sortie Script"
read -p "Quel est votre choix ?" choix_information_utilisateur 

        case $choix_information_utilisateur in 

        1) 
        echo "Droits/Permissions de l'utilisateur sur un dossier" 
        read -p "Quel dossier vous séléctionner ( ./path/nom_dossier ) ?" $directory      
        ssh $nom_utilisateur@$adresse_ip "sudo -S getfacl $directory | grep user"
	echo $(sudo getfacl $directory | grep user) >> Documents/$nom_fichier_texte.txt
 	echo "--------------" >>  Documents/$nom_fichier_texte.txt
        echo "$(date +%F-%X) - $USER - A afficher les droits/permissions de l'utilisateur sur un dossier" >> /var/log/log_evt.log
        read -p "appuyer sur entrée pour continuer :"
        menu_information_utilisateur;;

        2) 
        echo "Droits/Permissions de l'utilisateur sur un fichier"
        read -p "Quel fichier voulez vous sélectionner avec son emplacement ( ./path/nom_fichier ) ?" $file
        ssh $nom_utilisateur@$adresse_ip "sudo -S getfacl $file | grep user"
	echo $(sudo getfacl $file | grep user) >> Documents/$nom_fichier_texte.txt
 	echo "--------------" >>  Documents/$nom_fichier_texte.txt
        echo "$(date +%F-%X) - $USER - A afficher les droits/permissions de l'utilisateur sur un fichier" >> /var/log/log_evt.log
        read -p "appuyer sur entrée pour continuer :"
        menu_information_utilisateur;;

        3) 
        echo "Date de dernière connexion d'un utilisateur"
        ssh $nom_utilisateur@$adresse_ip "last $nom_utilisateur"
	echo $(last $nom_utilisateur) >> Documents/$nom_fichier_texte.txt
 	echo "--------------" >>  Documents/$nom_fichier_texte.txt
        echo "$(date +%F-%X) - $USER - A afficher les informations de la dernière connexion de l'utilisateur" >> /var/log/log_evt.log
        read -p "appuyer sur entrée pour continuer :"
        menu_information_utilisateur;;

        4) 
        echo "Date de dernière modification du mot de passe de l'utilisateur"
        ssh $nom_utilisateur@$adresse_ip "passwd $nom_utilisateur -S"
	echo $(passwd $nom_utilisateur -S) >>  Documents/$nom_fichier_texte.txt
 	echo "--------------" >>  Documents/$nom_fichier_texte.txt
        echo "$(date +%F-%X) - $USER - A afficher les informations de la dernière modification du mot de passe" >> /var/log/log_evt.log
        read -p "appuyer sur entrée pour continuer :"
        menu_information_utilisateur;;

        5) 
        echo "Liste des sessions ouvertes par l'utilisateur"
        ssh $nom_utilisateur@$adresse_ip "w"
	echo $(w) >>  Documents/$nom_fichier_texte.txt
 	echo "--------------" >>  Documents/$nom_fichier_texte.txt
        echo "$(date +%F-%X) - $USER - A lister les sessions ouvertes par l'utilisateur" >> /var/log/log_evt.log
        read -p "appuyer sur entrée pour continuer :"
        menu_information_utilisateur;;

        6) 
        echo "Liste des utilisateurs locaux"
        ssh $nom_utilisateur@$adresse_ip "cut -d: -f1 /etc/passwd"
	echo $(cut -d: -f1 /etc/passwd) >> Documents/$nom_fichier_texte.txt
 	echo "--------------" >>  Documents/$nom_fichier_texte.txt
        echo "$(date +%F-%X) - $USER - A lister les utilisateurs locaux" >> /var/log/log_evt.log
        read -p "appuyer sur entrée pour continuer :"
        menu_information_utilisateur;;

        r) 
           echo "Retour au Menu Précédent"
           echo "$(date +%F-%X) - $USER - est Retourner au Menu Précédent" >> /var/log/log_evt.log
	   menu_information;;
        
        x) 
           echo "Retour au Menu Principal"
	   echo "$(date +%F-%X) - $USER - est Retourner au Menu Principal" >> /var/log/log_evt.log
    	   menu_principal;;
           
        q) echo "Vous quittez le script "
	   sleep 3
	   echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
	   echo "--------------" >> /var/log/log_evt.log
	   sortie_script
	   ;;
	   
	*) echo "Mauvaise commande veuillez réessayer"
	   menu_information_systeme;; 
           
esac
}

#menu information système 

menu_information_systeme() 
{
clear
echo "Menu Information Système"

echo "1) Informations du processeur :"
echo "2) Mémoire RAM totale"
echo "3) Utilisation de la RAM"
echo "4) Utilisation du processeur"
echo "5) Utilisation du disque"
echo "6) La version du système d'exploitation"
echo "7) Liste des applications installées"
echo "r) Retour au Menu Précédent"
echo "x) Retour au Menu Principal"
echo "q) Sortie Script"
read -p  "Quel est votre choix ?" choix_information_system

case $choix_information_system in 

        1)     
        	echo "Informations du CPU ( type de processeur)"
                ssh $nom_utilisateur@$adresse_ip "lscpu"
		echo $(lscpu) >> Documents/$nom_fichier_texte.txt
  		echo "--------------" >>  Documents/$nom_fichier_texte.txt
                echo "$(date +%F-%X) - $USER - A afficher les informations du CPU" >> /var/log/log_evt.log
                read -p "appuyer sur entrée pour continuer :"
                menu_information_systeme;;

        2)      
        	echo "Mémoire RAM totale"
                ssh $nom_utilisateur@$adresse_ip "cat /proc/meminfo"
		echo $(cat /proc/meminfo) >>Documents/$nom_fichier_texte.txt
  		echo "--------------" >>  Documents/$nom_fichier_texte.txt
                echo "$(date +%F-%X) - $USER - A afficher les informations de la mémoire RAM" >> /var/log/log_evt.log
                read -p "appuyer sur entrée pour continuer :"
                menu_information_systeme;;

        3)      
        	echo "Utilisation de la RAM" 
                ssh $nom_utilisateur@$adresse_ip "free"
		echo $(free) >> Documents/$nom_fichier_texte.txt
  		echo "--------------" >> Documents/$nom_fichier_texte.txt
                echo "$(date +%F-%X) - $USER - A afficher les informations de l'utilisation de la RAM" >> /var/log/log_evt.log
                read -p "appuyer sur entrée pour continuer :"
                menu_information_systeme;;

        4)      
        	echo "Utilisation du processeur"
                ssh $nom_utilisateur@$adresse_ip "top"
		echo $(top) >> Documents/$nom_fichier_texte.txt
  		echo "--------------" >>  Documents/$nom_fichier_texte.txt
                echo "$(date +%F-%X) - $USER - A afficher les informations de l'utilisation de processeur" >> /var/log/log_evt.log
                read -p "appuyer sur entrée pour continuer :"
                menu_information_systeme;;

        5)      
        	echo "Utilisation du disque"
                ssh $nom_utilisateur@$adresse_ip "lsblk -f"
		echo $(lsblk -f) >> Documents/$nom_fichier_texte.txt
  		echo "--------------" >> Documents/$nom_fichier_texte.txt
                echo "$(date +%F-%X) - $USER - A afficher les informations de l'utilisation du disque" >> /var/log/log_evt.log
                read -p "appuyer sur entrée pour continuer :"
                menu_information_systeme;;

        6)      
        	echo "Version de l'OS :"
                ssh $nom_utilisateur@$adresse_ip "lsb_release -a" 
		echo $(lsb_release -a) >> Documents/$nom_fichier_texte.txt
  		echo "--------------" >>  Documents/$nom_fichier_texte.txt
                echo "$(date +%F-%X) - $USER - A afficher les informations de la version du systeme d'exploitation" >> /var/log/log_evt.log
                read -p "appuyer sur entrée pour continuer :"
                menu_information_systeme;; 

        7)      
        	echo "Liste des applications installées :"
                ssh $nom_utilisateur@$adresse_ip "sudo dpkg -l"
		echo $(sudo dpkg -l) >> Documents/$nom_fichier_texte.txt
  		echo "--------------" >> Documents/$nom_fichier_texte.txt
                echo "$(date +%F-%X) - $USER - A lister les applications installés" >> /var/log/log_evt.log
                read -p "appuyer sur entrée pour continuer :"
                menu_information_systeme;;

        r)      
        	echo "Retour au Menu Précédent"
          	echo "$(date +%F-%X) - $USER - est Retourner au Menu Précédent" >> /var/log/log_evt.log
                menu_information;;

        x)      clear
        	echo "Retour au Menu Principal"
		echo "$(date +%F-%X) - $USER - est Retourner au Menu Principal" >> /var/log/log_evt.log
		menu_principal;;
	
	q)	echo "Vous quittez le script "
		sleep 3
		echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
		echo "--------------" >> /var/log/log_evt.log
		sortie_script
		;;
	*)
		echo "Mauvaise commande veuillez réessayer"
		menu_information_systeme;;
			

esac
}
action_comptes_utilisateurs () {


    # Fonctions pour le menu Action - Comptes et Utilisateurs


creation_compte_utilisateur () {

        read -p "Nom de l'utilisateur dont le compte doit être créé? " user_account
        echo "$(date +%F-%X) - $USER - Création du mot de passe pour l'utilisateur $user_account" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S useradd -m $user_account"
        echo "Mot de passe créé pour l'utilisateur $user_account"
        sleep 2
    }   


changement_mot_de_passe_utilisateur () {

        read -p "Nom de l'utilisateur dont le mot de passe doit être changer ? " user_passwd
        echo "$(date +%F-%X) - $USER - Modification du mot de passe pour l'utilisateur $user_passwd" >> /var/log/log_evt.log
        ssh $nom_utilisateur@$adresse_ip "sudo -S chpasswd $user_passwd" 
        echo "Mot de passe changé pour l'utilisateur $user_passwd"
        sleep 2
    }

suppression_de_compte_utilisateur_local () {

        read -p "Nom de l'utilisateur dont le compte doit être supprimmé ? " del_user_local_account
        echo "$(date +%F-%X) - $USER - Suppression du compte de l'utilisateur local $del_user_local_account" >> /var/log/log_evt.log
        ssh $nom_utilisateur@$adresse_ip  "sudo -S deluser $del_user_local_account"
        echo "Suppression avec succès du compte pour l'utilisateur $del_user_local_account"

        sleep 2

    }


ajout_utilisateur_au_groupe_administrateur () {

        read -p "Nom de l'utilisateur qui doit être ajouté au groupe administrateur ? " add_user_to_admin
        echo "$(date +%F-%X) - $USER - Ajout de l'utilisateur $add_user_to_admin au groupe administrateur" >l> /var/log/og_evt.log
        ssh $nom_utilisateur@$adresse_ip  "sudo -S usermod -aG sudo "$add_user_to_admin""
        echo "Ajout avec succès de l'utilisateur $add_user_to_admin au groupe administrateur"
        sleep 2

    }



ajout_utilisateur_a_un_groupe_local () {
        
        read -p "Nom de l'utilisateur qui doit être ajouté au groupe utilisateur local ? " add_user_to_local_users
        echo "$(date +%F-%X) - $USER - Ajout de l'utilisateur $add_user_to_local_users au groupe local" >l> /var/log/og_evt.log
        ssh $nom_utilisateur@$adresse_ip  "sudo -S usermod -aG users "$add_user_to_local_users""
        echo "Ajout avec succès de l'utilisateur $add_user_to_local_users au groupe utilisateur local"
        sleep 2
    }

sortie_utilisateur_a_un_groupe_local () {

        read -p "Nom de l'utilisateur qui doit sortir du groupe utilisateur local ? " del_user_to_local_users
        echo "$(date +%F-%X) - $USER - sortie de l'utilisateur $del_user_to_local_users au groupe local" >l> /var/log/og_evt.log
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
    echo "q) Sortie Script"
    read -p "Votre choix ? :" repcmu

        case $repcmu in
            1) creation_compte_utilisateur ;;
            2) changement_mot_de_passe_utilisateur ;;
            3) suppression_de_compte_utilisateur_local ;;
            4) ajout_utilisateur_au_groupe_administrateur;;
            5) ajout_utilisateur_a_un_groupe_local ;;
            6) sortie_utilisateur_a_un_groupe_local ;;            
            r) echo "Retour au menu précédent" ; menu_action;;
            x) echo "Retour au menu principal" ; menu_principal ;;
            q) echo "Vous quittez le script "
	       sleep 3
               echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
               echo "--------------" >> /var/log/log_evt.log
	       sortie_script
	       ;;
            *) echo "Erreur choix non valide merci de modifier votre choix" ;; 
            
			
            
        esac

        sleep 2

    done


}



# Menu et fonctions pour : Action - Système


action_systeme() {



 # Déclaration des Fonctions pour le menu Action - Système


creation_repertoire () {

        read -p "Nom du repertoire à créer (En Chemin absolu) ? " mkdir_name
        echo "$(date +"%d/%m/%Y à %Hh%M") - $USER - Création du repertoire $mkdir_name" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S mkdir -v $mkdir_name"
        echo "Repertoire $mkdir_name créé "
        sleep 2
    }


suppression_repertoire () {

        read -p "Nom du repertoire à supprimer (En Chemin absolu) ? " del_dir_name
        echo "$(date +%F-%X) - $USER - Supression du repertoire $del_dir_name" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S rm -r -v $del_dir_name"
        # echo "Repertoire $del_dir_name supprimé "
        sleep 2
    }


installation_logiciel () {

        read -p "Nom du package à installer ? " install_soft
        echo "$(date +%F-%X) - $USER - Installation du package $install_soft" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S apt-get install $install_soft -y"
        echo "Package $install_soft installé "
        sleep 2
    }



desinstallation_logiciel () {

        read -p "Nom du package a installer ? " desinstall_soft
        echo "$(date +%F-%X) - $USER - Desinstallation du package $desinstall_soft" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S apt remove $desinstall_soft -y"
        echo "Package $desinstall_soft desinstallé "
        sleep 2
    }


execution_script () {

        read -p "Nom du script a lancer ? " exec_script
        echo "$(date +%F-%X) - $USER - Execution du script $exec_script" >> /var/log/log_evt.log 
        ssh $nom_utilisateur@$adresse_ip "sudo -S  ./$exec_script -y"
        echo "Script $exec_script lancé "
        sleep 2
    }


verrouillage_machine () {

        echo "Verrouillage de la machine" 
        echo "$(date +%F-%X) - $USER - Verrouillage de  la machine  : $adresse_ip" >> /var/log/log_evt.log
        sleep 2 
        ssh $nom_utilisateur@$adresse_ip "sudo -S systemctl suspend"
    }

redemarrage_machine () {

        echo "Redémarrage de la machine" 
        echo "$(date +%F-%X) - $USER - Redémarrage de la machine : $adresse_ip" >> /var/log/log_evt.log
        sleep 2 
        ssh $nom_utilisateur@$adresse_ip "sudo -S reboot"
    }


arret_machine () {

        echo "Arrêt de la machine" 
        echo "$(date +%F-%X) - $USER - Arrêt de la machine : $adresse_ip" >> /var/log/log_evt.log
        sleep 2 
        ssh $nom_utilisateur@$adresse_ip "sudo -S shutdown now"
    }


update_machine () {

        echo "Mise à jour du système de la machine" 
        echo "$(date +%F-%X) - $USER - Mise à jour du système : $adresse_ip" >> /var/log/log_evt.log
        ssh $nom_utilisateur@$adresse_ip "sudo -S apt update && apt upgrade -y"
        echo "Système mis à jour "
        sleep 2
    }



    # Menu Action Système

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
    echo "q) Sortie Script"
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
            r) echo "Retour au menu précédent" ; menu_action ;;
            x) echo "Retour au menu principal" ; menu_principal ;;
            q) echo "Vous quittez le script "
	       sleep 3
	       echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
	       echo "--------------" >> /var/log/log_evt.log
	       sortie_script;;
            *) echo "Erreur choix non valide merci de modifier votre choix" ;; 
	           
            
        esac

        sleep 2
    done


}
# Menu Information Pare-Feu 
menu_information_pare_feu(){
clear
echo "Menu Information Pare-Feu"
echo "1) Statut du Pare-Feu"
echo "2) Liste des Ports Ouverts"
echo "r) Retour au Menu Précédent"
echo "x) Retour au Menu Principal"
echo "q) Sortie Script"
read -p "faites votre choix :" choix_securite
case $choix_securite in

		1)
			ssh $nom_utilisateur@$adresse_ip "sudo -S ufw status"
  			echo $(sudo ufw status) >> Documents/$nom_fichier_texte.txt
     			echo "--------------" >>  Documents/$nom_fichier_texte.txt
			echo "$(date +%F-%X) - $USER - a affiché le status du Pare-feu" >> /var/log/log_evt.log
			read -p "appuyer sur entrée pour continuer :"
			menu_information_pare_feu;;
			
		2)
			ssh $nom_utilisateur@$adresse_ip "ss -tulpn"
   			echo $(ss -tulpn) >> Documents/$nom_fichier_texte.txt
      			echo "--------------" >>  Documents/$nom_fichier_texte.txt
                	echo "$(date +%F-%X) - $USER - a effectué l'action "Affichage liste ports ouvert"" >> /var/log/log_evt.log
			read -p "appuyer sur entrée pour continuer :"
			menu_information_pare_feu;;

		r)
			echo "retour au menu précédent"
			echo "$(date +%F-%X) - $USER - est retourné au Menu Précédent" >> /var/log/log_evt.log
			menu_information;;

		x)
			echo "Retour au Menu Principal"
			echo "$(date +%F-%X) - $USER - est retourné au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;

		q)
			echo "Vous quittez le script "
			sleep 3
			echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
			echo "--------------" >> /var/log/log_evt.log
			sortie_script
			;;
			

		*)
			echo "mauvaise commande veuillez réesayer"
			echo "$(date +%F-%X) - $USER - a utilisé une mauvaise commande, menu relancé" >> /var/log/log_evt.log 
			menu_information_pare_feu;;

esac
} 
# Menu journalisation Permet d'acceder au donnée du fichier log 

menu_journalisation(){

echo "Menu Journalisation"
echo "1) Recherche des événements dans le fichier log_evt.log par utilisateur"
echo "2) Affichage des événements éffectuer sur l'Ordinateur"
echo "r) Retour au Menu Précédent"
echo "x) Retour au Menu Principal"
echo "q) Sortie Script"
read -p "faites votre choix :" choix_journalisation
case $choix_journalisation in

		1)
			clear
			read -p "Entrer le nom d'utilisateur :" utilisateur
			ssh $nom_utilisateur@$adresse_ip "cat /var/log/log_evt.log | grep "$utilisateur""
   			echo $(cat /var/log/log_evt.log | grep "$utilisateur") >> Documents/$nom_fichier_texte.txt
      			echo "--------------" >>  Documents/$nom_fichier_texte.txt
			echo "$(date +%F-%X) - $USER - à Rechercher des événements éffectuer par $utilisateur" >> /var/log/log_evt.log 
			read -p "appuyer sur entrée pour continuer :"
			clear
			menu_journalisation;;

		2)
			clear
			ssh $nom_utilisateur@$adresse_ip "cat /var/log/log_evt.log"
			echo "$(date +%F-%X) - $USER - à éffectuer l'action Affichage des événement de l'Ordinateur" >> /var/log/log_evt.log 
			read -p "appuyer sur entrée pour continuer :"
			clear
			menu_journalisation;;

		r)
			echo "Retour au Menu Précédent"
			echo "$(date +%F-%X) - $USER - est Retourner au Menu Précédent" >> /var/log/log_evt.log
			menu_information;;

		x)
			echo "Retour au Menu Principal"
			echo "$(date +%F-%X) - $USER - est Retourner au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;

		q)
			echo "Vous quittez le script "
			sleep 3			
			echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
			echo "--------------" >> /var/log/log_evt.log
			sortie_script
			;;

		*)
                        echo "Mauvaise commande veuillez réessayer"
                        echo "$(date +%F-%X) - $USER - a Utilisé une mauvaise commande" >> /var/log/log_evt.log 
                        menu_journalisation;;

esac

}


# Menu Information Réseaux 

menu_information_reseaux()

{

echo "Menu Information Réseaux"

echo "1) Affichage adresse MAC"
echo "2) Nombre d'interface réseaux"
echo "3) Affichage adresse IP"
echo "4) Affichage liste ports ouvert"
echo "r) Retour au Menu Précédent"
echo "x) Retour au Menu Principal"
echo "q) Sortie Script"
read -p "Faites votre choix :" choix_reseaux

case $choix_reseaux in

		1) 
			ssh $nom_utilisateur@$adresse_ip "ip a | grep link/ether | cut -d\  -f 6"
			echo $(ip a | grep link/ether | cut -d\  -f 6) >> Documents/$nom_fichier_texte.txt
   			echo "--------------" >> Documents/$nom_fichier_texte.txt
   			echo "$(date +%F-%X) - $USER - à effectuer l'action Affichage de l'adresse mac" >> /var/log/log_evt.log
			read -p "appuyer sur entrée pour continuer :"
			clear
			menu_information_reseaux;;

		2)
			interface_reseaux=$(ssh $nom_utilisateur@$adresse_ip "ls /sys/class/net/ | wc -l")
   			echo "le Nombre d'interface réseaux et de $interface_reseaux" >> Documents/$nom_fichier_texte.txt
      			echo "--------------" >> Documents/$nom_fichier_texte.txt
			echo "le Nombre d'interface réseaux et de $interface_reseaux"
			echo "$(date +%F-%X) - $USER - à effectuer l'action Affichage du nombre d'interface réseaux" >> /var/log/log_evt.log
			read -p "appuyer sur entrée pour continuer :"
			clear
			menu_information_reseaux;;

		3)
			ssh $nom_utilisateur@$adresse_ip "ip a | grep inet | cut -d\  -f 6"
   			echo $(ip a | grep inet | cut -d\  -f 6) >> Documents/$nom_fichier_texte.txt
      			echo "--------------" >> Documents/$nom_fichier_texte.txt
			echo "$(date +%F-%X) - $USER - à effectuer l'action Affichage adresse IP" >> /var/log/log_evt.log
			read -p "appuyer sur entrée pour continuer :"
			clear
			menu_information_reseaux;;

		4)
			ssh $nom_utilisateur@$adresse_ip "ss -tulpn"
   			echo $(ss -tulpn) >> Documents/$nom_fichier_texte.txt
      			echo "--------------" >> Documents/$nom_fichier_texte.txt
			echo "$(date +%F-%X) - $USER - à effectuer l'action Affichage liste ports ouvert" >> /var/log/log_evt.log
			read -p "appuyer sur entrée pour continuer :"
			clear
			menu_information_reseaux;;

		r)
			echo "retour au menu précédent"
			echo "$(date +%F-%X) - $USER - est Retourné au Menu Précédent" >> /var/log/log_evt.log
			menu_information;;

		x)
			echo "Retour au Menu Principal"
			echo "$(date +%F-%X) - $USER - est Retourné au Menu Principal" >> /var/log/log_evt.log
			sleep 3
			menu_principal;;
		q)
			echo "Vous quittez le script "
			sleep 3
			echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
			echo "--------------" >> /var/log/log_evt.log
			sortie_script
			;;
			
		*)
			echo "mauvaise commande veuillez réesayer"
			echo "$(date +%F-%X) - $USER - à Utilisé une mauvaise commande" >> /var/log/log_evt.log 
			sleep 3
			menu_information_reseaux;;

esac
}

# Permet d'établir de nouvelles règles sur le pare-feu
menu_regle_parefeu () {
read -p "Vous désirez : 
A) Autoriser/Ouvrir un protocole ou un port
I) Interdire/Fermer un protocole ou un port
r) Revenir au menu précédent (Action sur les Pare-Feux)
x) Revenir au menu Principal
q) Sortie Script
" action_parefeu

	case $action_parefeu in
		A)
			clear
			action=allow
			echo "Autorisation/Ouverture : "
			read -p "De quel port ? (entrez le numéro du port ou laissez vide et appuyez sur entrée) " port
			read -p "De quel protocole ? (entrez le nom du protocole ou laissez vide et appuyez sur entrée) " protocole
			;;
		I)
			clear
			action=deny
			echo "Interdiction/Fermeture : "
			read -p "De quel port ? (entrez le numéro du port ou laissez vide et appuyez sur entrée) " port
			read -p "De quel protocole ? (entrez le nom du protocole ou laissez vide et appuyez sur entrée) " protocole
			;;

		r)
			echo "Retour au menu Action sur les Pare-Feux"
			echo "$(date +%F-%X) - $USER - est Retourné au Menu Précédent" >> /var/log/log_evt.log
			menu_gestion_parefeu;;
			
		x)
			echo "Retour au menu Principal"
			echo "$(date +%F-%X) - $USER - est Retourné au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;
		
		q)
			echo "Vous quittez le script "
			echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
			echo "--------------" >> /var/log/log_evt.log
			sortie_script
			;;
			
		*)
			echo "Mauvaise commande veuillez réessayer"
			menu_regle_parefeu;;
	esac
	# Vérifie que l'utilisateur a bien séléctionné un port ou un protocole à modifier pour établir une nouvelle règle sur le pare-feu. N'applique pas de nouvelles règles sur le pare-feu si rien a été séléctionné.
	if [ $protocole -z ] && [ $port -z ]
	then	
		echo "Aucun port où protocole n'a été séléctionné "
		sleep 3
  		clear
  		echo "$(date +%F-%X) - $USER - n'a défini aucune nouvelle règle de pare-feu" >> /var/log/log_evt.log
		menu_gestion_parefeu

	# Applique la nouvelle règle de pare-feu
	else
		echo "Nouvelle règle de pare feu établie : $port $protocole $action"
		ssh $nom_utilisateur@$adresse_ip "sudo -S ufw $action $port $protocole"
		sleep 3
  		clear
  		echo "$(date +%F-%X) - $USER - a défini $action $protocole $port comme nouvelle règle de pare-feu" >> /var/log/log_evt.log
		menu_regle_parefeu
	fi
}
# Menu de gestion basic du pare-feu. Permet d'accéder à la gestion avancé du parefeu (établir de nouvelles règles)
menu_gestion_parefeu () {

echo "Menu Gestion du Pare-feu
1) Activation du Pare-feu
2) Désactivation du Pare-feu
3) Définir une nouvelle règle de pare-feu
r) Retour au menu Action
x) Retour au menu Principal
q) Sortie Script
	"
	read -p "Que souhaitez-vous réaliser ? " choix

	case $choix in
		1)
			echo "Le pare-feu est Activé"
   			ssh $nom_utilisateur@$adresse_ip "Sudo -S ufw enable"
			echo "$(date +%F-%X) - $USER - a Activé le pare-feu" >> /var/log/log_evt.log
			menu_gestion_parefeu;;
		2)
			echo "Le pare-feu est désactivé"
   			ssh $nom_utilisateur@$adresse_ip "Sudo -S ufw disable"
			
			echo "$(date +%F-%X) - $USER - a désactivé le pare-feu" >> /var/log/log_evt.log
			menu_gestion_parefeu;;
		3)
			echo "Définition d'une nouvelle règle de pare-feu"
			echo "$(date +%F-%X) - $USER - a choisi de définir une nouvelle règle de pare-feu" >> /var/log/log_evt.log
			sleep 1
			menu_regle_parefeu;;
		r)
			echo "Retour au menu Action"
			echo "$(date +%F-%X) - $USER - est Retourné au Menu Action" >> /var/log/log_evt.log
			menu_action;;
			
		x)
			echo "Retour au Menu Principal"
			echo "$(date +%F-%X) - $USER - est Retourné au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;
			
		q)
			echo "Vous quittez le script "
			sleep 3
			echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
			echo "--------------" >> /var/log/log_evt.log
			sortie_script
			;;
			
		*)
			echo "Mauvaise commande veuillez réessayer"
			menu_gestion_parefeu;;
	
	esac
# Sous-menu de Menu-principal. Permet à l'utilisateur des se diriger vers des sous-sous-menu thématiques en fonction du type d'Information qu'il recherche
}
menu_information(){
clear
echo "Menu Information"
echo "1) Menu Information Compte / Utilisateurs"
echo "2) Menu Information Réseaux"
echo "3) Menu Information Systeme"
echo "4) Menu Information Pare-feu"
echo "5) Consulter le journal des événements"
echo "x) Retour au Menu principal"
echo "q) Sortie Script"
read -p "A quel menu voulez vous accéder :" choix_menu
case $choix_menu in

		1)
			echo "Ouverture Menu Information Compte / Utilisateurs"
			echo "$(date +%F-%X) - $USER - a Sélectionné le Menu Information Compte / Utilisateur" >> /var/log/log_evt.log
			sleep 2
			clear
			menu_information_utilisateur;;

		2)
			echo "Ouverture Menu Réseaux"
			echo "$(date +%F-%X) - $USER - a Sélectionné le Menu Réseaux" >> /var/log/log_evt.log
			sleep 2
			clear
			menu_information_reseaux;;

		3)
			echo "Ouverture Menu système"
			echo "$(date +%F-%X) - $USER - a Sélectionné le Menu Système" >> /var/log/log_evt.log
			sleep 2
			clear
			menu_information_systeme;;

		4)
			echo "Ouverture Menu sécurité"
			echo "$(date +%F-%X) - $USER - a Sélectionné le Menu Sécurité" >> /var/log/log_evt.log
			sleep 2
			clear
			menu_information_pare_feu;;

		5)
			echo "Ouverture Menu Journalisation"
			echo "$(date +%F-%X) - $USER - a choisi de Conulter le journal des évenements" >> /var/log/log_evt.log
			sleep 2
			clear
			menu_journalisation;;

		x)
			echo "Retour au Menu Principal"
			echo "$(date +%F-%X) - $USER - est Retourné au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;
			
		q)
			echo "Vous quittez le script "
			sleep 3
			echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
			echo "--------------" >> /var/log/log_evt.log
			sortie_script
			;;
			
		*)
			echo "mauvaise commande veuillez réesayer"
			echo "$(date +%F-%X) - $USER - a Utilisé une mauvaise commande" >> /var/log/log_evt.log 
			menu_information;;

esac
}

# Sous-menu de Menu-principal. Permet à l'utilisateur de se diriger vers des sous-menu thématiques en fonction du type d'action qu'il veut appliquer

menu_action () {
clear
echo "Menu Action
1) Menu Comptes et Utilisateurs
2) Menu Action Système
3) Menu Gestion du Pare-Feu 
x) Retour au menu Principal
q) Sortie Script"
	read -p "Quel action souhaitez-vous réaliser ? " choix
	
	case $choix in
		1)	
			clear
			echo "$(date +%F-%X) - $USER - a sélectionné le Menu Compte et Utilisateur" >> /var/log/log_evt.log
			action_comptes_utilisateurs;;
		2)
			clear
			echo "$(date +%F-%X) - $USER - a sélectionné le Menu Action sur le Système" >> /var/log/log_evt.log
			action_systeme;;
		3)
			clear
			echo "$(date +%F-%X) - $USER - a sélectionné le Menu Sécurité" >> /var/log/log_evt.log
			menu_gestion_parefeu;;
		x)
			echo "Retour au menu principal "
			echo "$(date +%F-%X) - $USER - est retourné au Menu Principal" >> /var/log/log_evt.log
			menu_principal;;
			
		q)
                	echo "Vous quittez le script "
			sleep 3
			echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
			echo "--------------" >> /var/log/log_evt.log
			sortie_script
			;;
		*)	
                	echo "Mauvaise commande veuillez réesayer"
                	menu_action;;
               
			
	esac	
}


menu_ssh_connex_distance () {

ssh $nom_utilisateur@$adresse_ip
menu_principal

}


# Fontion du Menu principal. Envoi l'utilisateur vers les sous-menus/fonctions Information et action
menu_principal () {
clear
	echo "			__________________________________________________"
	echo "			|:						:|"
	echo "			|:						:|"
	echo "			|:	    	  MENU PRINCIPAL 		:|"
	echo "			|:						:|"
	echo "			|:______________________________________________:|
	
	1) Effectuer des actions (exemple : créer un dossier, activer un par-feu...)
	2) Rechercher des informations (exemple : liste des utilisateurs, utilisation de la RAM....)
 	3) Connexion à un hôte en SSH
	x) Quitter le script"
	

	echo ""
	read -p "	Que souhaitez-vous réaliser ? 	" choix
	
	case $choix in
		1)
			echo "$(date +%F-%X) - $USER - a Sélectionné le Menu Effectuer des actions" >> /var/log/log_evt.log
			menu_action;;
		2)
			echo "$(date +%F-%X) - $USER - a Sélectionné le Menu Rechercher des Informations" >> /var/log/log_evt.log
			menu_information;;
		3)
			echo "$(date +%F-%X) - $USER - a Sélectionné Prise de main à distance" >> /var/log/log_evt.log
			menu_ssh_connex_distance;;
		x)
			echo "Vous quittez le script"
			sleep 3
			echo "$(date +%F-%X) - $USER - ********EndScript********" >> /var/log/log_evt.log
			echo "--------------" >> /var/log/log_evt.log
			sortie_script;;
		*)
			echo "Mauvaise commande veuillez réessayer"
			menu_principal;;
		

		esac
}
# Donne les droits d'accès en écriture au fichier de journalisation et Début de la Journalisation dans le fichier log_evt.log
sudo chmod 777 /var/log/log_evt.log
sudo chmod 777 /var/log
sudo chmod 777 /var
echo "--------------" >> /var/log/log_evt.log
echo "$(date +%F-%X) - $USER - ********StartScript********" >> /var/log/log_evt.log

# Connexion Identification à la machine cliente
read -p "A quel machine voulez-vous vous connecter en ssh ? ( adresse ip )" adresse_ip
read -p "Veuillez renseigner le nom d'utilisateur pour ssh ? " nom_utilisateur

# Nom du fichier qui contiendra les informations colléctées sur la machine cliente
nom_fichier_texte=info\_$nom_utilisateur\_$(date +%F)
# Le script commence ici
touch /Documents/$nom_fichier_texte.txt
menu_principal

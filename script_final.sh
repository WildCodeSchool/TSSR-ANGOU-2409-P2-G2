#!/bin/bash
menu_information_pare_feu(){
echo "Menu Information Pare-Feu"
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
			menu_information_pare_feu;;
			
		2)
			ss -tulpn
                	echo "$USER $(date) à effectuer l'action Affichage liste ports ouvert" >> /var/log/log_evt.log
			menu_information_pare_feu;;

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
			menu_information_pare_feu;;

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
menu_information_reseaux(){

echo "Menu Information Réseaux"

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
			menu_information_reseaux;;

		2)
			ls /sys/class/net/ | wc -l
			echo "$USER $(date) à effectuer l'action Affichage du nombre d'interface réseaux" >> /var/log/log_evt.log
			menu_information_reseaux;;

		3)
			ip a | grep inet | cut -d\  -f 6
			echo "$USER $(date) à effectuer l'action Affichage adresse IP" >> /var/log/log_evt.log
			menu_information_reseaux;;

		4)
			ss -tulpn
			echo "$USER $(date) à effectuer l'action Affichage liste ports ouvert" >> /var/log/log_evt.log
			menu_information_reseaux;;

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
			menu_information_reseaux;;

esac
}

menu_regle_parefeu () {

	read -p "Vous désirez : 

	A) Autoriser/Ouvrir un protocole ou un port
	I) Interdire/Fermer un protocole ou un port
	r) Revenir au menu précédent (Action sur les Pare-Feux)
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
			menu_gestion_parefeu;;
		*)
			echo "Mauvaise commande veuillez réessayer"
			menu_regle_parefeu;;
	esac
	
	if [ $protocole -z ] && [ $port -z ]
	then	
		echo "Aucun port où protocole n'a été séléctionné "
		clear
		menu_gestion_parefeu
	else
		echo "Nouvelle regle de pare feu établie : $port $protocole $action"
		sudo ufw $action $port $protocole
		menu_regle_parefeu
	fi
}	
menu_gestion_parefeu () {

	echo "Menu Gestion du Pare-feu

	1) Activation du Pare-feu
	2) Désactivation du Pare-feu
	3) Définire une nouvelle règle de pare-feu
	4) Retour au menu Action
	"
	read -p "Que souhaitez-vous réaliser ? " choix

	case $choix in
		1)
			echo "Le pare-feu est désactivé"
			sudo ufw enable
			menu_gestion_parefeu;;
		2)
			echo "Le pare-feu est activé"
			sudo ufw disable
			menu_gestion_parefeu;;
		3)
			echo "Définition d'une nouvelle règle de pare-feu"
			sleep 1
			menu_regle_parefeu;;
		4)
			echo "Retour au menu Action"
			menu_action;;
		*)
			echo "Mauvaise commande veuillez réessayer"
			menu_gestion_parefeu;;
	
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
			menu_comptes_et_utilisateurs;;

		2)
			echo "Ouverture Menu Réseaux"
			echo "$USER $(date) à Sélectionner le Menu Réseaux" >> /var/log/log_evt.log
			menu_information_reseaux;;

		3)
			echo "Ouverture Menu système"
			echo "$USER $(date) à Sélectionner le Menu Système" >> /var/log/log_evt.log
			menu_system;;

		4)
			echo "Ouverture Menu sécurité"
			echo "$USER $(date) à Sélectionner le Menu Sécurité" >> /var/log/log_evt.log
			menu_information_pare_feu;;

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
menu_action () {

	echo "Menu Action
	
	1) Menu Comptes et Utilisateurs
	2) Menu Système
	3) Menu Gestion du Pare-Feu 
	x) Retour au menu Principal
	"
	read -p "Quel action souhaitez-vous réaliser ? " choix
	
	case $choix in
		1)
			menu_comptes_et_utilisateurs;;
		2)
			menu_system;;
		3)
			menu_gestion_parefeu;;
		x)
			echo "Retour au menu principal "
			menu_principal;;
		*)	
                	echo "Mauvaise commande veuillez réesayer"
                	menu_principal;;
	esac	
}
menu_principal () {

	echo "Menu Principal
	
	1) Effectuer des actions (exemple : créer un dossier, activer un par-feu...)
	2) Rechercher des informations (exemple : liste des utilisateurs, utilisation de la RAM....)	
	x) Quitter le script
	"
	read -p "Que souhaitez-vous réaliser ? " choix
	
	case $choix in
		1)
			menu_action;;
		2)
			menu_information;;
		x)
			echo "Vous quittez le script "
			sleep 3
			exit;;
		*)
			echo "Mauvaise commande veuillez réessayer"
			menu_principal;;
		esac
}

menu_principal

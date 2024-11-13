#!/bin/bash

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
			sudo ufw enable;;
		2)
			echo "Le pare-feu est activé"
			sudo ufw disable;;
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
		3)
			menu_information_reseaux;;
		x)
			echo "Vous quittez le script "
			sleep 3
			exit;;
		*)
			echo "Mauvaise commande veuillez réessayer"
			menu_principal;;
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
menu_principal

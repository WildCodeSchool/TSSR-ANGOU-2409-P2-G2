#!/bin/bash
adress_ip=""
nom_utilisateur=""

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
	3) Menu Securité
	x) Retour au menu Principal
	"
	read -p "Quel action souhaitez-vous réaliser ? " choix
	
	case $choix in
		1)
			menu_comptes_et_utilisateurs;;
		2)
			menu_system;;
		3)
			menu_securite;;
		x)
			echo "Retour au menu principal "
			menu_principal;;
		*)	
                	echo "Mauvaise commande veuillez réesayer"
                	menu_principal;;
	esac	
}
menu_principal

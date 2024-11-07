#!/bin/bash

# Déclaration des variables

adresse_ip=""
nom_utilisateur=""

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

# Fonctions

function creation_compte_utilisateur() {

read -p "Nom de l'utilisateur dont le compte doit être créer ? " user_account
echo "$date - Création du mot de passe pour l'utilisateur $user_account" >> /var/log/log_evt.log 

ssh $nom_utilisateur@$adresse_ip "sudo -S useradd -m $user_account"
echo "mot de passe créer pour l'utilisateur $user_account

{


function changement_mot_de_passe_utilisateur() {


{

function Suppression_de_compte_utilisateur_local() {


{


function Ajout_utilisateur_a_un_groupe_administrateur() {


{



function XXXXXXXX() {


{




# Menu action comptes et utilisateurs


echo "Menu action comptes et utilsateurs :"
        echo "1) Création de compte utilisateur local"
        echo "2) Changement de mot de passe utilisateur"
        echo "3) Suppression de compte utilisateur local"
        echo "4) Ajout utilisateur à un groupe administrateur"
        echo "5) Ajout utilisateur à un groupe local"
        echo "6) Sortie utilisateur d'un groupe local"
        echo "7) Retour au menu précédent "
        echo "8) Retour au menu principal "
        
        read -p "Votre choix ? : " rep1


               case $choix in
            1) creation_compte_utilisateur;;
            2) changement_mot_de_passe_utilisateur;;
            3) Suppression_de_compte_utilisateur_local ;;
            4) ajout_utilisateur_a_un_groupe_administrateur;;
            5) ajout_utilisateur_a_un_groupe_local ;;
            6) sortie_utilisateur_a_un_groupe_local ;;            
            7) echo "Retour au menu précédent " ;;
            8) echo "Retour au menu principal " ;;
            *) echo "Erreur, choix non valide. Merci de modifier votre choix" ;;
        esac
    done






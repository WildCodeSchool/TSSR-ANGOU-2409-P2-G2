#!/bin/bash

# Déclaration des variables

adresse_ip=""
nom_utilisateur=""

réseaux(){

echo "Menu Réseaux"

echo "1) Affichage addresse mac"
echo "2) Nombre d'interface réseaux"
echo "3) Affichage adresse IP"
echo "4) Affichage liste ports ouvert"
echo "r) Retour au menu précédent"
echo "x) retour au menu principal"
read -p "faites votre choix :" choix
case $choix in

        1)
                ip a | grep link/ether | cut -d\  -f 6
                réseaux;;

        2)
                ;;

        3)
                ip a | grep inet | cut -d\  -f 6

                réseaux;;

        4)
                ss -tulpn

                réseaux;;

        r)
                echo "retour au menu précédent"
                menuprécédent;;

        x)
                echo "retour au menu principal"
                menu_principal;;

        *)
                echo "mauvaise commande veuillez réesayer"
                réseaux;;
esac
}


# Fonctions

function creation_compte_utilisateur() {

read -p "Nom de l'utilisateur dont le compte doit être créer ? " user_account
echo "$date - Création du mot de passe pour l'utilisateur $user_account" >> log_evt.log 

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






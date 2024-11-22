#Les lignes dans chaque fonctions correspondant à :
# echo $(<commande>) >> $nom_fichier_texte.txt
# permettent d'inscrire les informations recueillis sur la machine client dans un fichier portant le nom de l'utilisateur dans ~/Documents
#
#Menu information utilisateur 


# Fonction de fin du script : Restreint les droits d'accès en écriture au fichier de journalisation du fichier log_evt.log et son chemin à leur statut d'origine et quitte le script
function sortie_script {


    exit 0
}

function menu_information_utilisateur {

    Clear-Host
    Write-Host "Menu information utilisateur" 
    Write-Output "1) Droits/Permissions de l'utilisateur sur un dossier" 
    Write-Output "2) Droits/Permissions de l'utilisateur sur un fichier"
    Write-Output "3) Date de derniere connexion d'un utilisateur"
    Write-Output "4) Date de derniere modification du mot de passe de l'utilisateur" 
    Write-Output "5) Liste des sessions ouvertes par l'utilisateur"
    Write-Output "6) Liste des utilisateurs locaux"
    Write-Output "r) Retour au menu Precedent"
    Write-Output "x) Retour au Menu Principal"
    Write-Output "q) Sortie Script"
    $choix_information_utilisateur = Read-Host -Prompt "Quel est votre choix ?" 

    switch ($choix_information_utilisateur) {

        1 {
            Write-Output "Droits/Permissions de l'utilisateur sur un dossier" 
            #Write-Output ""
            #Write-Output "" >> Documents/$nom_fichier_texte.txt
            #Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            #Write-Output "- A afficher les droits/permissions de l'utilisateur sur un dossier" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_utilisateur 
        }
        

        2 {
            Write-Output "Droits/Permissions de l'utilisateur sur un fichier"
            #Write-Output ""
            #Write-Output "" >> Documents/$nom_fichier_texte.txt
            #Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            #Write-Output "- A afficher les droits/permissions de l'utilisateur sur un fichier" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_utilisateur 
        }
        

        3 {
            Write-Output "Date de derniere connexion d'un utilisateur"
            #Write-Output ""
            #Write-Output "" >> Documents/$nom_fichier_texte.txt
            #Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            #Write-Output "- A afficher les informations de la dernière connexion de l'utilisateur" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_utilisateur
        }

        4 {
            Write-Output "Date de derniere modification du mot de passe de l'utilisateur"
            #Write-Output ""
            #Write-Output "" >> Documents/$nom_fichier_texte.txt
            #Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            #Write-Output "- A afficher les informations de la dernière modification du mot de passe" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_utilisateur 
        }

        5 {
            Write-Output "Liste des sessions ouvertes par l'utilisateur"
            #Write-Output ""
            #Write-Output "" >> Documents/$nom_fichier_texte.txt
            #Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            #Write-Output "- A lister les sessions ouvertes par l'utilisateur" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_utilisateur 
        }

        6 {
            Write-Output "Liste des utilisateurs locaux"
            #Write-Output ""
            #Write-Output "" >> Documents/$nom_fichier_texte.txt
            #Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            #Write-Output "- A lister les utilisateurs locaux" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_utilisateur
        }


        r {
            Write-Output "Retour au Menu Precedent"
            # Write-Output "est Retourné au Menu Précédent" >> /Windows/Système32/log_evt.log
            menu_information 
        }

        x {
            Write-Output "Retour au Menu Principal"
            #Write-Output "est Retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal 
        }
           
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            #Write-Output "- ********EndScript********" >> /Windows/Système32/log_evt.log
            #Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script
        }
    
    
        default { 
            Write-Output "Mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_information_utilisateur
        }           
    }
}

#menu information systeme 

function menu_information_systeme {
    Clear-Host
    Write-Output "Menu Information Systeme"

    Write-Output "1) Informations du processeur :"
    Write-Output "2) Mémoire RAM totale"
    Write-Output "3) Utilisation de la RAM"
    Write-Output "4) Utilisation du processeur"
    Write-Output "5) Utilisation du disque"
    Write-Output "6) La version du systeme d'exploitation"
    Write-Output "7) Liste des applications installees"
    Write-Output "r) Retour au Menu Précédent"
    Write-Output "x) Retour au Menu Principal"
    Write-Output "q) Sortie Script"
    $choix_information_system = Read-Host -Prompt  "Quel est votre choix ?" 

    switch ($choix_information_system) {
   
    


        1 {    
            Write-Output "Informations du CPU ( type de processeur)"
            Write-Output ""
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "- A afficher les informations du CPU" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme
        }

        2 {  
            Write-Output "Mémoire RAM totale"
            Write-Output ""
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "- A afficher les informations de la mémoire RAM" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme
        }

        3 {
            Write-Output "Utilisation de la RAM" 
            Write-Output ""
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "- A afficher les informations de l'utilisation de la RAM" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme 
        }

        4 {
            Write-Output "Utilisation du processeur"
            Write-Output ""
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "- A afficher les informations de l'utilisation de processeur" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme
        }

        5 {  
            Write-Output "Utilisation du disque"
            Write-Output ""
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "- A afficher les informations de l'utilisation du disque" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme 
        }

        6 {      
            Write-Output "Version de l'OS :"
            Write-Output ""
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "- A afficher les informations de la version du système d'exploitation" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme
        }

        7 {   
            Write-Output "Liste des applications installees :"
            # Write-Output ""
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "A lister les applications installés" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme; ;
        }

        r {
            Write-Output "retour au menu precedent"
            # Write-Output "est Retourné au Menu Précédent" >> /Windows/Système32/log_evt.log
            menu_information 
        }

        x {
            Write-Output "Retour au Menu Principal"
            #Write-Output "est Retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal 
        }
        
	
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            # Write-Output "" >> /Windows/Système32/log_evt.log
            # Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script
        }
		
        default {
            Write-Output "Mauvaise commande veuillez réessayer"
            Start-Sleep 2
            menu_information_systeme 
        }
    }
}

# function action_comptes_utilisateurs () {


#     Fonctions pour le menu Action - Comptes et Utilisateurs
 


#    function creation_compte_utilisateur {

#         read -p "Nom de l'utilisateur dont le compte doit être créé ? : " user_account
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Création du mot de passe pour l'utilisateur $user_account" >> /var/log/log_evt.log 
#         ssh $nom_utilisateur@$adresse_ip "sudo -S useradd $user_account "
#         sleep 2
#    }   


#     changement_mot_de_passe_utilisateur () {

#         read -p "Nom de l'utilisateur dont le mot de passe doit être changer ? : " user_passwd
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Modification du mot de passe pour l'utilisateur $user_passwd" >> /var/log/log_evt.log
#         ssh $nom_utilisateur@$adresse_ip "sudo -S passwd $user_passwd" 
#         echo "Mot de passe changé pour l'utilisateur $user_passwd"
#         sleep 2
#     }

#     suppression_de_compte_utilisateur_local () {

#         read -p "Nom de l'utilisateur dont le compte doit être supprimé ? : " del_user_local_account
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Suppression du compte de l'utilisateur local $del_user_local_account" >> /var/log/log_evt.log
#         ssh $nom_utilisateur@$adresse_ip  "sudo -S deluser $del_user_local_account"
#        echo "Suppression avec succès du compte pour l'utilisateur $del_user_local_account"
#         sleep 2
#     }
#     ajout_utilisateur_au_groupe_administrateur () {

#        read -p "Nom de l'utilisateur qui doit être ajouté au groupe administrateur ? : " add_user_to_admin
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Ajout de l'utilisateur $add_user_to_admin au groupe administrateur" >l> /var/log/og_evt.log
#          ssh $nom_utilisateur@$adresse_ip  "sudo -S usermod -aG sudo "$add_user_to_admin""
#         echo "Ajout avec succès de l'utilisateur $add_user_to_admin au groupe administrateur"
#        sleep 2
#     }



#     ajout_utilisateur_a_un_groupe_local () {
       
#         read -p "Nom de l'utilisateur qui doit être ajouté au groupe utilisateur local ? : " add_user_to_local_users
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Ajout de l'utilisateur $add_user_to_local_users au groupe local" >l> /var/log/og_evt.log
#         ssh $nom_utilisateur@$adresse_ip  "sudo -S usermod -aG users "$add_user_to_local_users""
#         echo "Ajout avec succès de l'utilisateur $add_user_to_local_users au groupe utilisateur local"
#         sleep 2
#     }

#     sortie_utilisateur_a_un_groupe_local () {

#         read -p "Nom de l'utilisateur qui doit sortir du groupe utilisateur local ? : " del_user_to_local_users
#        echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - sortie de l'utilisateur $del_user_to_local_users au groupe local" >l> /var/log/og_evt.log
#        ssh $nom_utilisateur@$adresse_ip  "sudo -S deluser "$del_user_to_local_users" users"
#         echo "Suppression avec succès de l'utilisateur $del_user_to_local_users du groupe utilisateur local"
#         sleep 2

#   }

#     # Menu action comptes et utilisateurs

    menu_action_compte_utilisateurs {


      Clear-Host
      Write-Output "Menu Action comptes et utilisateurs :"
      Write-Output "----------------------------------"
      write-output "1- Création de compte utilisateur local"
      write-output "2- Changement de mot de passe utilisateur"
      write-output "3- Suppression de compte utilisateur local"
      write-output "4- Ajout utilisateur à un groupe administrateur"
      write-output "5- Ajout utilisateur à un groupe local"
      write-output "6- Sortie utilisateur de groupe local"
      write-output "r- Retour au menu précédent"
      write-output "x- Retour au menu principal"
      write-output "q) Sortie Script"

       $repcmu = Read-Host -Prompt "Votre choix ?"

 

switch ($repcmu) {

    1 {
          Write-Output "Création d'un compte utilisateur"
          $user_account = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être créé ? :"
          $passwd = Read-Host -Prompt "Mot de passe de l'utilisateur dont le compte doit être créé ? :" -AsSecureString
          Write-Output " $nom_utlisateur à effectuer l'action création du compte utilisateur $user_account" >> /Windows/Système32/log_evt.log
          Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  New-Local User ( $user_account / $passwd ) }
          #Write-Output "--------------" >> /Windows/Système32/log_evt.log
          Start-Sleep 2
          menu_action_compte_utilisateurs
    }

    2 {  
        Write-Output "Changement mot de passe utilisateur"
        
        $user_passwd = Read-Host -Prompt "Nom de l'utilisateur dont le mot de passe doit être changé ? :"
        $new_passwd = Read-Host -Prompt "Entrez le nouveau mot de passe" -AsSecureString
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  Set-LocalUser -Name $user_passwd -Password $new_passwd }
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2
        menu_action_compte_utilisateurs
        
    }

    3 {  
        Write-Output "Suppression de compte utilisateur local"
        $del_user_local_account = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être supprimé ? :"
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  remove-localuser -Name $del_user_local_account }
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2
        menu_action_compte_utilisateurs
        
    }
        
    4 {  
        Write-Output "Ajout utilisateur au groupe administrateur"
        $add_user_to_admin = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être ajouté au groupe administrateur ? :"
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  Add-LocalGroupMember -Group administrateur -Member $add_user_to_admin }   
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2
        menu_action_compte_utilisateurs
    }


    5 {  
        Write-Output "Ajout utilisateur a un groupe local"
        $add_user_to_grp = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être ajouté a un groupe ? :"
        $grp = Read-Host -Prompt "Nom du groupe auquel l'utilisateur doit être ajouté ? :"
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  Add-LocalGroupMember -Group $grp -Member $add_user_to_grp }    
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2
        menu_action_compte_utilisateurs
    }



    6 {  
        Write-Output "sortie utilisateur d'un groupe local"
        $del_user_to_grp = Read-Host -Prompt "nom de l'utilisateur dont le compte doit être ajoutésupprimé d'un groupe ? :"
        $del_grp = Read-Host -Prompt "Nom du groupe auquel l'utilisateur doit être supprimé ? :"
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  del-LocalGroupMember -Group $del_grp -Member $del_user_to_grp }
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2
        menu_action_compte_utilisateurs
}

    r {  
    Write-Output "Retour au menu précédent"
    menu_action
    }

    x {  
        Write-Output "Retour au menu principal"
        menu_principal
        }

    q {
      Write-Output "Vous quittez le script "
      Start-Sleep 3
      Write-Output "" >> /Windows/Système32/log_evt.log
      Write-Output "--------------" >> /Windows/Système32/log_evt.log
      sortie_script }

  default {  
    echo "Erreur choix non valide merci de modifier votre choix"
    Start-Sleep 2
}
}



# Menu et fonctions pour : Action - Système

#function action_systeme {

# Déclaration des Fonctions pour le menu Action - Système


       creation_repertoire {
# 
          $mkdir_name = Read-Host -Prompt "Nom du repertoire à créer (En Chemin absolu) ? : "
#         read -p "Nom du répertoire à créer (En Chemin absolu) ? : " mkdir_name
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Création du répertoire $mkdir_name" >> /var/log/log_evt.log 
          Invoke-command
#         ssh $nom_utilisateur@$adresse_ip "sudo -S mkdir -v $mkdir_name"
          write output "Repertoire $mkdir_name créé "
          Start-Sleep 2
     }
# 
# 
      suppression_repertoire  {
# 
         $del_dir_name = Read-Host -Prompt "Nom du repertoire à supprimer (En Chemin absolu) ? : "
#        read -p "Nom du repertoire à supprimer (En Chemin absolu) ? : " del_dir_name
#        echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Suppression du répertoire $del_dir_name" >> /var/log/log_evt.log
         Invoke-command
#        ssh $nom_utilisateur@$adresse_ip "sudo -S rm -r -v $del_dir_name"
         write output "Repertoire $del_dir_name supprimé "
         Start-Sleep 2
    }


    installation_logiciel  {
# 
          $install_soft = Read-Host -Prompt "Nom du package à installer ? : " 
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Installation du package $install_soft" >> /var/log/log_evt.log 
          Invoke-command
#         ssh $nom_utilisateur@$adresse_ip "sudo -S apt-get install $install_soft -y"
          write output  "Package $install_soft installé "
          Start-Sleep 2
     }
# 
# 
# 
    desinstallation_logiciel  {
# 
          $desinstall_soft = Read-Host -Prompt "Nom du package à desinstaller ? : "
#         read -p "Nom du package a installer ? : " desinstall_soft
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Désinstallation du package $desinstall_soft" >> /var/log/log_evt.log 
          Invoke-command
#         ssh $nom_utilisateur@$adresse_ip "sudo -S apt remove $desinstall_soft -y"
          write output  "Package $desinstall_soft desinstallé "
          Start-Sleep 2
    }
# 
# 
      execution_script {
# 
#         read -p "Nom du script a lancer ? : " exec_script
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Exécution du script $exec_script" >> /var/log/log_evt.log 
          Invoke-command         
#         ssh $nom_utilisateur@$adresse_ip "sudo -S  ./$exec_script -y"
          write output  "Script $exec_script lancé"
#         echo "Script $exec_script lancé"
          Start-Sleep 2
      }
# 
# 
     verrouillage_machine {
           
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Verrouillage de  la machine  : $adresse_ip" >> /var/log/log_evt.log
          Invoke-commandInvoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock { Lockworkstation }
          write-output "Verrouillage de la machine" 
          Start-Sleep 2 
#         ssh $nom_utilisateur@$adresse_ip "sudo -S systemctl suspend"
     }
# 
     redemarrage_machine {
# 
          write-output "Redémarrage de la machine" 
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Redémarrage de la machine : $adresse_ip" >> /var/log/log_evt.log
          Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock { Restart-Computer }
          Start-Sleep 2          
#         ssh $nom_utilisateur@$adresse_ip "sudo -S reboot"
    }
# 
# 
     arret_machine {
# 
          write-output "Arrêt de la machine" 
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Arrêt de la machine : $adresse_ip" >> /var/log/log_evt.log
          Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock { Stop-Computer }          
          Start-Sleep 2
#         ssh $nom_utilisateur@$adresse_ip "sudo -S shutdown now"
     }
# 
# 
     update_machine {
# 
#         echo "Mise à jour du système de la machine" 
#         echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Mise à jour du système : $adresse_ip" >> /var/log/log_evt.log
          Invoke-Command -ComputerName CLIWIN01 -Credential wilder -ScriptBlock {  Import-Module PSWindowsUpdate Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot } 
#         ssh $nom_utilisateur@$adresse_ip "sudo -S apt update && apt upgrade -y"
          write-output "Système mis à jour "
          Start-Sleep 2
    }

    menu_action_compte_utilisateurs {

      write-output "Menu Action système :"
      write-output "---------------------"
      write-output "1- Création de répertoire"
      Write-Output "2- Suppression de répertoire"
      write-output "3- Installation de logiciel (distribution Linux Ubuntu)"
      write-output "4- Désinstallation de logiciel (distribution Linux Ubuntu)"
      write-output "5- Exécution de script sur une machine distante"
      write-output "6- Verrouillage de la machine"
      write-output "7- Redémarrage de la machine"
      write-output "8- Arrêt de la machine"
      write-output "9- Mise à jour du système de la machine"
      write-output "r- Retour au menu précédent"
      write-output "x- Retour au menu principal"
      write-output "q) Sortie Script"
      $reps = Read-Host -Prompt "Votre choix ?"


switch ($reps) {

    1 {
        Write-Output "Création de repertoire"
        $mkdir_name = Read-Host -Prompt "Nom du repertoire à créer ? : "
        $path_mkdir_name = Read-Host -Prompt "Chemin du repertoire à créer ? : "
        # Write-Output "--------------" >> /Windows/Système32/log_evt.log
        # echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Création du répertoire $mkdir_name" >> /var/log/log_evt.log 
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  New-Item -Name $mkdir_name -ItemType Directory -path $path_mkdir_name} 
        write output "Repertoire $mkdir_name créé "
        Start-Sleep 2
        menu_action_compte_utilisateurs
    }


    2 {
        Write-Output "Suppression de repertoire"
        $del_dir_name = Read-Host -Prompt "Nom du repertoire à supprimer (En Chemin absolu) ? : "
        # $path_deldir_name = Read-Host -Prompt "Chemin du repertoire à supprimer ? : "
        # echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Suppression du répertoire $del_dir_name" >> /var/log/log_evt.log
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  Remove-Item -Name $del_dir_name }
        write output "Repertoire $del_dir_name supprimé "
        Start-Sleep 2
        menu_action_compte_utilisateurs

    }

    3 {
        Write-Output " Installation de logiciel"
        $install_soft = Read-Host -Prompt "Nom du package à installer ? : " 
        # echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Installation du package $install_soft" >> /var/log/log_evt.log 
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  Get-PackageProvider $install_soft}
        write output  "Package $install_soft installé "
        Start-Sleep 2
        menu_action_compte_utilisateurs

    }

    4 {
        Write-Output " Desinstallation de logiciel"
        $desinstall_soft = Read-Host -Prompt "Nom du package à desinstaller ? : " 
#       echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Installation du package $install_soft" >> /var/log/log_evt.log 
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock {  Uninstall-Package -Name $desinstall_soft}
        write output  "Package $desinstall_soft desinstallé "
        Start-Sleep 2
        menu_action_compte_utilisateurs
    }


    5 {
        Write-Output " Exécution de script sur une machine distante"
        $exec_script = Read-Host -Prompt "Nom du script a lancer ? : "  
#       echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - Installation du package $install_soft" >> /var/log/log_evt.log 
        IInvoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock { $exec_script }
        write output  "Package $exec_script lancé "
        Start-Sleep 2
        menu_action_compte_utilisateurs
        


    }

    6 {
        Write-Output "Verrouillage de la machine"
        Invoke-commandInvoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock { Lockworkstation }
        write-output "Verrouillage de la machine" 
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2 
        menu_action_compte_utilisateurs
        

    }



    7 {
        Write-Output " Redémarrage machine"
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock { Restart-Computer }
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2 
        menu_action_compte_utilisateurs


    }


    8 {
        Write-Output " Arrêt machine"
        Invoke-Command -computername CLIWIN01 -credential wilder -ScriptBlock { Stop-Computer }
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2 
        menu_action_compte_utilisateurs

    }


    9 {
        Write-Output " Mise à jour de la machine"
        Invoke-Command -ComputerName CLIWIN01 -Credential wilder -ScriptBlock {  Import-Module PSWindowsUpdate Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot }
        #Write-Output "--------------" >> /Windows/Système32/log_evt.log
        Start-Sleep 2 
        menu_action_compte_utilisateurs

    }


}
}

#----------- A SUPPRILMER--------------
# 1) creation_repertoire ; ;
# 2) suppression_repertoire ; ;
# 3) installation_logiciel ; ;
# 4) desinstallation_logiciel ; ;
# 5) execution_script ; ;
# 6) verrouillage_machine ; ;            
# 7) redemarrage_machine ; ;
# 8) arret_machine ; ;
# 9) update_machine ; ;
# r) echo "Retour au menu précédent" ; menu_action ; ;
# x) echo "Retour au menu principal" ; menu_principal ; ;
# q) echo "Vous quittez le script "
# sleep 3
# echo "$(date +%F-%X) - $nom_utilisateur - $machineclient - ********EndScript********" >> /var/log/log_evt.log
# echo "--------------" >> /var/log/log_evt.log
# sortie_script; ;
# * ) echo "Erreur choix non valide merci de modifier votre choix" ; ;            
# esac
# 
# done
#--------------------------------------


# Menu Information Pare-Feu 
function menu_information_pare_feu {

    Clear-Host
    Write-Output "Menu Information Pare-Feu"
    Write-Output "1) Statut du Pare-Feu"
    Write-Output "2) Liste des Ports Ouverts"
    Write-Output "r) Retour au Menu Precedent"
    Write-Output "x) Retour au Menu Principal"
    Write-Output "q) Sortie Script"
    $choix_securite = Read-Host -Prompt "faites votre choix " 
    switch ($choix_securite) {

        1 {
            Write-Output "Statut du Pare-Feu"
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "- a affiché le status du Pare-feu" >> /Windows/Système32/log_evt.log
            menu_information_pare_feu 
        }
			
        2 {
            Write-Output "Liste des Ports Ouverts"
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            # Write-Output "- a effectué l'action Affichage liste ports ouvert" >> /Windows/Système32/log_evt.log
            menu_information_pare_feu 
        }

        r {
            Write-Output "Retour au Menu Precedent"
            # Write-Output "est Retourné au Menu Precedent" >> /Windows/Système32/log_evt.log
            menu_information 
        }

        x {
            Write-Output "Retour au Menu Principal"
            #Write-Output "est Retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal 
        }

        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            # Write-Output "" >> /Windows/Système32/log_evt.log
            # Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script 
        }

			

        default {
            Write-Output "mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_information_pare_feu 
        }
    }
} 
# Menu journalisation Permet d'accéder au donnée du fichier log 

function menu_journalisation {

    Clear-Host
    Write-Output "Menu Journalisation"
    Write-Output "1) Recherche des evenements dans le fichier log_evt.log par utilisateur"
    Write-Output "2) Recherche des evenements dans le fichier log_evt.log pour un Ordinateur"
    Write-Output "r) Retour au Menu Precedent"
    Write-Output "x) Retour au Menu Principal"
    Write-Output "q) Sortie Script"
    $choix_journalisation = Read-Host -Prompt "faites votre choix "

    switch ($choix_journalisation) {

        1 {
            Clear-Host
            #$utilisateur = Read-Host -Prompt "Entrer le nom d'utilisateur : " 
            #Get-Content /Windows/Système32/log_evt.log | grep "$utilisateur"
            #Write-Output "" >> Documents/$nom_fichier_texte.txt
            #Write-Output "--------------" >>  Documents/$nom_fichier_texte.txt
            #Write-Output "- à Rechercher des événements effectuer par $utilisateur" >> /Windows/Système32/log_evt.log
            Read-Host "appuyer sur entrée pour continuer " 
            menu_journalisation 
        }

        2 {
            Clear-Host
            # $ordinateur = Read-Host -Prompt "Entrer le nom de l'Ordinateur : " 
            # Get-Content /Windows/Système32/log_evt.log | grep "$ordinateur"
            # Write-Output " à effectuer l'action Affichage des événement de l'Ordinateur" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer " 
            menu_journalisation 
        }
    
        r {
            Write-Output "Retour au Menu Precedent"
            # Write-Output "est Retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_information 
        }

        x {
            Write-Output "Retour au Menu Principal"
            # Write-Output "est Retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal 
        }
    
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            # Write-Output "" >> /Windows/Système32/log_evt.log
            # Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script 
        }
    
        default {
            Write-Output "mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_journalisation 
        }
    }
}
# Menu Information Réseaux 

function menu_information_reseaux {

    Clear-Host
    Write-Output "Menu Information Reseaux"

    Write-Output "1) Affichage adresse MAC"
    Write-Output "2) Nombre d'interface reseaux"
    Write-Output "3) Affichage adresse IP"
    Write-Output "4) Affichage liste ports ouvert"
    Write-Output "r) Retour au Menu Precedent"
    Write-Output "x) Retour au Menu Principal"
    Write-Output "q) Sortie Script"
    $choix_reseaux = Read-Host -Prompt "Faites votre choix "

    switch ($choix_reseaux) { 

        1 {
            
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >> Documents/$nom_fichier_texte.txt
            # Write-Output " - à effectuer l'action Affichage de l'adresse mac" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_reseaux 
        }

        2 {
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >> Documents/$nom_fichier_texte.txt
            # Write-Output "- à effectuer l'action Affichage du nombre d'interface réseaux" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_reseaux 
        }

        3 {   
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >> Documents/$nom_fichier_texte.txt
            # Write-Output "- à effectuer l'action Affichage adresse IP" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_reseaux 
        }

        4 {
            
            # Write-Output "" >> Documents/$nom_fichier_texte.txt
            # Write-Output "--------------" >> Documents/$nom_fichier_texte.txt
            # Write-Output "- à effectuer l'action Affichage liste ports ouvert" >> /Windows/Système32/log_evt.log
            Read-Host -Prompt "appuyer sur entree pour continuer " 
            menu_information_reseaux 
        }

        r {
            Write-Output "retour au Menu Precedent"
            #Write-Output "est retourné au Menu Précédent" >> /Windows/Système32/log_evt.log
            menu_information 
        } 
        

        x { 
            Write-Output "Retour au Menu Principal"
            #Write-Output "st retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal 
        } 

        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            # Write-Output "" >> /Windows/Système32/log_evt.log
            # Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script 
        } 

			
        default {
            Write-Output "mauvaise commande veuillez reessayer"
            # Write-Output "- à Utilisé une mauvaise commande" >> /Windows/Système32/log_evt.log
            Start-Sleep 2
            menu_information_reseaux 
        }
    }
}

# Permet d'établir de nouvelles règles sur le pare-feu
function menu_regle_parefeu {

    $action_parefeu = Read-Host -Prompt "Vous desirez :
A) Autoriser/Ouvrir un protocole ou un port
I) Interdire/Fermer un protocole ou un port
r) Revenir au menu precedent (Action sur les Pare-Feux)
x) Revenir au menu Principal
q) Sortie Script
" 


    switch ($action_parefeu) {

        A {
            Clear-Host
            # $action=allow
            Write-Output "Autorisation/Ouverture : "
            # $port = Read-Host -Prompt "De quel port ? (entrez le numéro du port ou laissez vide et appuyez sur entrée) " 
            # $protocole = Read-Host -Prompt "De quel protocole ? (entrez le nom du protocole ou laissez vide et appuyez sur entrée) " 
        }
        
        I {
            Clear-Host
            # $action=deny
            Write-Output "Interdiction/Fermeture : "
            # $port = Read-Host -Prompt "De quel port ? (entrez le numéro du port ou laissez vide et appuyez sur entrée) " 
            # $protocole = Read-Host -Prompt "De quel protocole ? (entrez le nom du protocole ou laissez vide et appuyez sur entrée) " 
        }

        r {
            Write-Output "Retour au menu Action sur les Pare-Feux"
            # Write-Output "- est Retourné au Menu Précédent" >> /Windows/Système32/log_evt.log
            menu_gestion_parefeu 
        }
			
        x {
            Write-Output "Retour au menu Principal"
            # Write-Output "- est Retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal
        }
		
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            # Write-Output "" >> /Windows/Système32/log_evt.log
            # Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script 
        }
			
        default {
            Write-Output "Mauvaise commande veuillez réessayer"
            Start-Sleep 2
            menu_regle_parefeu
        }
    }


    # Vérifie que l'utilisateur a bien sélectionné un port ou un protocole à modifier pour établir une nouvelle règle sur le pare-feu. N'applique pas de nouvelles règles sur le pare-feu si rien a été sélectionné.
    #     if ($protocole -z ) && ( $port -z )
    #     {
    #         Write-Output "Aucun port où protocole n'a été sélectionné "
    #         Start-Sleep 3
    #         Clear-Host
    #         Write-Output "- n'a défini aucune nouvelle règle de pare-feu" >> /Windows/Système32/log_evt.log
    #         menu_gestion_parefeu
    #     }
    # Applique la nouvelle règle de pare-feu
    #     else
    #     {
    #         Write-Output "Nouvelle règle de pare feu établie : $port $protocole $action"
    #         Start-Sleep 3
    #         Clear-Host
    #         Write-Output "- a défini $action $protocole $port comme nouvelle règle de pare-feu" >> /Windows/Système32/log_evt.log
    #         menu_regle_parefeu

    #     }
}
# Menu de gestion basic du pare-feu. Permet d'accéder à la gestion avancé du pare-feu (établir de nouvelles règles)
function menu_gestion_parefeu {
    Clear-Host
    Write-Output "Menu Gestion du Pare-feu
    1) Activation du Pare-feu
    2) Désactivation du Pare-feu
    3) Définir une nouvelle regle de pare-feu
    r) Retour au menu Action
    x) Retour au menu Principal
    q) Sortie Script
	"
    $choix = Read-Host -Prompt "Que souhaitez-vous realiser ? " 

    switch ($choix) {
        
        1 {
            Write-Output "Le pare-feu est Active"
            # Write-Output "- a Activé le pare-feu" >> //Windows/Système32/log_evt.log
            menu_gestion_parefeu
        }
        2 {
            Write-Output "Le pare-feu est desactive"
            # Write-Output "- a désactivé le pare-feu" >> /Windows/Système32/log_evt.log
            menu_gestion_parefeu 
        }
        3 {
            Write-Output "Définition d'une nouvelle regle de pare-feu"
            # Write-Output "- a choisi de définir une nouvelle regle de pare-feu" >> /Windows/Système32/log_evt.log
            Start-Sleep 2
            menu_regle_parefeu 
        }
        r { 
            Write-Output "Retour au menu Action"
            # Write-Output "- est Retourné au Menu Action" >> /Windows/Système32/log_evt.log
            menu_action 
        }
			
        x { 
            Write-Output "Retour au Menu Principal"
            # Write-Output "- est Retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal 
        }
			
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Write-Output "" >> /Windows/Système32/log_evt.log
            Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script 
        } 

			
        default {
            Write-Output "Mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_gestion_parefeu; ;
        }	
    }
}
# Sous-menu de Menu-principal. Permet à l'utilisateur des se diriger vers des sous-sous-menu thématiques en fonction du type d'Information qu'il recherche

function menu_information {

    Clear-Host
    Write-Output "Menu Information"
    Write-Output "1) Menu Information Compte / Utilisateurs"
    Write-Output "2) Menu Information Reseaux"
    Write-Output "3) Menu Information Systeme"
    Write-Output "4) Menu Information Pare-feu"
    Write-Output "5) Consulter le journal des evenements"
    Write-Output "x) Retour au Menu principal"
    Write-Output "q) Sortie Script"
    $choix_menu = Read-Host -Prompt "A quel menu voulez vous acceder " 
    switch ($choix_menu) {

        1 {
            Write-Output "Ouverture Menu Information Compte / Utilisateurs"
            # Write-Output " a Sélectionné le Menu Information Compte / Utilisateur" >> /Windows/Système32/log_evt.log
            Start-Sleep 2
            Clear-Host
            menu_information_utilisateur 
        }

        2 {
            Write-Output "Ouverture Menu Information Reseaux"
            # Write-Output "- a Sélectionné le Menu Information Réseaux" >> /Windows/Système32/log_evt.log
            Start-Sleep 2
            Clear-Host
            menu_information_reseaux 
        }

        3 {
            Write-Output "Ouverture Menu Information Systeme"
            # Write-Output "- a Sélectionné le Menu Information Système" >> /Windows/Système32/log_evt.log
            Start-Sleep 2
            Clear-Host
            menu_information_systeme 
        }

        4 {
            Write-Output "Ouverture Menu securite"
            # Write-Output "- a Sélectionné le Menu Information Sécurité" >> /Windows/Système32/log_evt.log
            Start-Sleep 2
            Clear-Host
            menu_information_pare_feu 
        }

        5 {
            Write-Output "Ouverture Menu Journalisation"
            # Write-Output "- a choisi de Consulter le journal des événements" >> /Windows/Système32/log_evt.log
            Start-Sleep 2
            Clear-Host
            menu_journalisation 
        }

        x {
            Write-Output "Retour au Menu Principal"
            # Write-Output "- est Retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal 
        }
			
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            # Write-Output "- ********EndScript********" >> /Windows/Système32/log_evt.log
            # Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script 
        }
			
        default {
            Write-Output "mauvaise commande veuillez reessayer"
            Start-Sleep 3
            menu_information
        } 
    }
}

# Sous-menu de Menu-principal. Permet à l'utilisateur de se diriger vers des sous-menu thématiques en fonction du type d'action qu'il veut appliquer

function menu_action {

    Clear-Host
    Write-Output "Menu Action
    1) Menu Comptes et Utilisateurs
    2) Menu Action Système
    3) Menu Gestion du Pare-Feu 
    x) Retour au menu Principal
    q) Sortie Script"
    $choix = Read-Host "Quel action souhaitez-vous realiser ? " 
	
    switch ($choix) {
        
        1 {
            Clear-Host
            # Write-Output "- a sélectionné le Menu Compte et Utilisateur" >> /Windows/Système32/log_evt.log
            action_comptes_utilisateurs 
        }
        
        2 {
            Clear-Host
            # Write-Output "- a sélectionné le Menu Action sur le Système" >> /Windows/Système32/log_evt.log
            action_systeme 
        }

        3 {
            Clear-Host
            # Write-Output "- a sélectionne le Menu Gestion Du Pare-Feu" >> /Windows/Système32/log_evt.log
            menu_gestion_parefeu 
        }

        x {
            Write-Output "Retour au menu principal "
            # Write-Output "- est retourné au Menu Principal" >> /Windows/Système32/log_evt.log
            menu_principal 
        }
			
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            # Write-Output "- ********EndScript********" >> /Windows/Système32/log_evt.log
            # Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script 
        }

        default {	
            Write-Output "Mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_action
        }          
    }		
}


function menu_ssh_connex_distance {

    menu_principal

}


# Fonction du Menu principal. Envoi l'utilisateur vers les sous-menus/fonctions Information et action
function menu_principal {
    Clear-Host
    Write-Output "			__________________________________________________"
    Write-Output "			|:						:|"
    Write-Output "			|:						:|"
    Write-Output "			|:	    	  MENU PRINCIPAL 		:|"
    Write-Output "			|:						:|"
    Write-Output "			|:______________________________________________:|
	
	1) Effectuer des actions (exemple : creer un dossier, activer un par-feu...)
	2) Rechercher des informations (exemple : liste des utilisateurs, utilisation de la RAM....)
 	3) Connexion a un hote en SSH
	x) Quitter le script"
	

    Write-Output ""
    $choix = Read-Host -Prompt "	Que souhaitez-vous realiser ? 	" 
	
    switch ($choix) {

        1 {
            #Write-Output "- a Sélectionné le Menu Effectuer des actions" >> /Windows/Système32/log_evt.log
            menu_action 
        }

        2 {
            #Write-Output " - a Sélectionné le Menu Rechercher des Informations" >> /Windows/Système32/log_evt.log
            menu_information 
        }

        3 {
            #Write-Output " a Sélectionné Prise de main à distance" >> /Windows/Système32/log_evt.log
            menu_ssh_connex_distance 
        }

        x {
            Write-Output "Vous quittez le script"
            Start-Sleep 3
            # Write-Output "- ********EndScript********" >> /Windows/Système32/log_evt.log
            #Write-Output "--------------" >> /Windows/Système32/log_evt.log
            sortie_script 
        }
    
        default {
            Write-Output "Mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_principal
        }
    }
}
# Donne les droits d'accès en écriture au fichier de journalisation et Début de la Journalisation dans le fichier log_evt.log
#sudo chmod 777 /var/log/log_evt.log
#sudo chmod 777 /var/log
#sudo chmod 777 /var
#Write-Output "--------------" >> /var/log/log_evt.log
#Write-Output " ********StartScript********" >> /var/log/log_evt.log

# Connexion Identification à la machine cliente
#$adresse_ip = Read-Host -Prompt "A quel machine voulez-vous vous connecter en ssh ( adresse ip ) ? : " 
#$nom_utilisateur = Read-Host -Prompt "Veuillez renseigner le nom d'utilisateur pour ssh ? : "
#machineclient=$(ssh $nom_utilisateur@$adresse_ip "hostname")
# Nom du fichier qui contiendra les informations collectées sur la machine cliente
#nom_fichier_texte=info\_$nom_utilisateur\_$(date)
# Le script commence ici

menu_principal

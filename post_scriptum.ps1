function sortie_script {


    exit 0
}

#Menu information utilisateur 

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
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value ""
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les droits/permissions de l'utilisateur sur un dossier" 
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_utilisateur 
        }
        

        2 {
            Write-Output "Droits/Permissions de l'utilisateur sur un fichier"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value ""
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les droits/permissions de l'utilisateur sur un fichier"
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_utilisateur 
        }
        

        3 {
            Write-Output "Date de derniere connexion d'un utilisateur"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value ""
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations de la dernière connexion de l'utilisateur"
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_utilisateur
        }

        4 {
            Write-Output "Date de derniere modification du mot de passe de l'utilisateur"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value ""
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations de la dernière modification du mot de passe"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_utilisateur 
        }

        5 {
            Write-Output "Liste des sessions ouvertes par l'utilisateur"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value ""
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - $machineclient - A lister les sessions ouvertes par l'utilisateur"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_utilisateur 
        }

        6 {
            Write-Output "Liste des utilisateurs locaux"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value ""
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A lister les utilisateurs locaux"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_utilisateur
        }


        r {
            Write-Output "Retour au Menu Precedent"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Précédent"
            menu_information 
        }

        x {
            Write-Output "Retour au Menu Principal"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal 
        }
           
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------"
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
	    $CPU = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-CimInstance -ClassName Win32_Processor }
     	    $CPU
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$CPU"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations du CPU"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme
        }

        2 {  
            Write-Output "Mémoire RAM totale"
	    $MémoireTotal = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty TotalPhysicalMemory }
            $MémoireTotalMB = [Math]::Round($MémoireTotal / 1MB)
	    Write-Output "La Mémoire Ram Tolale $MémoireTotalMb Mb" 
	    Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "La Mémoire Ram Tolale $MémoireTotalMb Mb"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations de la mémoire RAM"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme
        }

        3 {
            Write-Output "Utilisation de la RAM" 
	    $MémoireTotal = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty TotalPhysicalMemory }
            $MémoireTotalMB = [Math]::Round($MémoireTotal / 1MB)
	    $MemoireDisponibleMb = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { (New-Object System.Diagnostics.PerformanceCounter("Memory", "Available MBytes")).NextValue() }
	    $MemoireUtiliseMB = $MémoireTotalMB - $MemoireDisponibleMb
     	    $MemoireUtilisePourcent = [Math]::Round(($MemoireUtiliseMB / $MémoireTotalMB) * 100, 2)
	    Write-Output "La Mémoire Ram et Utilisé à $MemoireUtilisePourcent%"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "La Mémoire Ram et Utilisé à $MemoireUtilisePourcent%"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations de l'utilisation de la RAM"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme 
        }

        4 {
            Write-Output "Utilisation du processeur"
	    $CPU_Utilisation = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { [string](Get-WmiObject -Class win32_processor).LoadPercentage }
            Write-Output "Le Processeur et utilisé à $CPU_Utilisation%"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$CPU_Utilisation"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations de l'utilisation de processeur"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme
        }

        5 {  
            Write-Output "Utilisation du disque"
	    $TailleTotaldisk = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | Measure-Object -Property Size -Sum | Select-Object -ExpandProperty Sum }
            $espacelibre = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | Measure-Object -Property Freespace -Sum | Select-Object -ExpandProperty Sum }
            $utilisationdisk = $TailleTotaldisk - $espacelibre
            $utilisationdiskMb = [Math]::Round($utilisationdisk / 1GB)
            Write-Output "$utilisationdiskMb Gb Utilisé par le disque"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$utilisationdiskMb Gb Utilisé par le disque"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations de l'utilisation du disque"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme 
        }

        6 {      
            Write-Output "Version de l'OS :"
	    $OS = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-WmiObject Win32_OperatingSystem }
            $OS
            Add-Content -Path C:\Users\Administrateur\Documents\$nom_fichier_texte.txt -Value "$OS"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations de la version du système d'exploitation"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme
        }

        7 {   
            Write-Output "Liste des applications installées :"
	    $Logiciel = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | sort-object -property DisplayName | Format-Table –AutoSize }
            $Application = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | sort-object -property DisplayName | Format-Table –AutoSize }
            $Logiciel 
	    $Application
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$Logiciel $Application"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - $nom_utilisateur - $machineclient - A listé les applications installés"
            Read-Host -Prompt "appuyer sur entree pour continuer "
            menu_information_systeme; ;
        }

        r {
            Write-Output "retour au menu precedent"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Précédent"
            menu_information 
        }

        x {
            Write-Output "Retour au Menu Principal"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal 
        }
        
	
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------"
            sortie_script
        }
		
        default {
            Write-Output "Mauvaise commande veuillez réessayer"
            Start-Sleep 2
            menu_information_systeme 
        }
    }
}



#    Menu action comptes et utilisateurs
    function menu_action_comptes_utilisateurs {


      Clear-Host
      Write-Output "Menu Action comptes et utilisateurs :"
      Write-Output "----------------------------------"
      write-output "1- Création de compte utilisateur local"
      write-output "2- Changement de mot de passe utilisateur"
      write-output "3- Suppression de compte utilisateur local"
      write-output "4- Desactivation de compte utilisateur local"
      write-output "5- Ajout utilisateur à un groupe administrateur"
      write-output "6- Ajout utilisateur à un groupe local"
      write-output "7- Sortie utilisateur de groupe local"
      write-output "r- Retour au menu précédent"
      write-output "x- Retour au menu principal"
      write-output "q) Sortie Script"

       $repcmu = Read-Host -Prompt "Votre choix ?"

    # Actions effectuées en fonction du choix de l'utilisateur dans le menu ci-dessus
    switch ($repcmu) {

        1 {
            Clear-host
            Write-Output "Création d'un compte utilisateur"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $user_account = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être créé ? " ;
	    $passwd = Read-Host -Prompt "Mot de passe de l'utilisateur dont le compte doit être créé ? " -AsSecureString ;
	    New-LocalUser -Name $user_account -Password $passwd }
	    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - à effectuer l'action création du compte utilisateur $user_account"            
            menu_action_comptes_utilisateurs
        }

        2 {  
            Clear-host
            Write-Output "Changement mot de passe utilisateur"           
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $user_passwd = Read-Host -Prompt "Nom de l'utilisateur dont le mot de passe doit être changé ? " ;
	    $new_passwd = Read-Host -Prompt "Entrez le nouveau mot de passe" -AsSecureString ;
	    Set-LocalUser -Name $user_passwd -Password $new_passwd }
            Read-Host -Prompt "Appuyer sur entrée pour continuer "
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - à effectuer l'action changement du mot de passe utilisateur $user_passwd"
            menu_action_comptes_utilisateurs
            
        }

        3 {  
	    Clear-host
	    Write-Output "Suppression de compte utilisateur local"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $del_user_local_account = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être supprimé ? " ;
            Remove-Localuser -Name $del_user_local_account }
	    Write-Output "Le compte utilisateur local $del_user_local_account à été supprimé "
            Read-Host -Prompt "Appuyer sur entrée pour continuer "
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - Suppression du compte de l'utilisateur local $del_user_local_account"
            menu_action_comptes_utilisateurs
            
        }


	4 {  
	    Clear-host
            Write-Output "Désactivation de compte utilisateur local"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $deactivate_user = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être désactivé ? " ; 
	    Disable-LocalUser -Name $deactivate_user }   
            Write-Output "Le compte utilisateur local $deactivate_user à été désactivé "
	    Read-Host -Prompt "Appuyer sur entrée pour continuer "
            menu_action_comptes_utilisateurs
        }



     
        5 {  

	    Clear-host
            Write-Output "Ajout utilisateur au groupe administrateur"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $add_user_to_admin = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être ajouté au groupe administrateur ? " ; 
	    Add-LocalGroupMember -Group Administrateurs -Member $add_user_to_admin }   
            Write-Output "Le compte utilisateur local $add_user_to_admin à été ajouté au groupe Administrateurs "
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - Ajout de l'utilisateur $add_user_to_admin au groupe administrateur"
            Read-Host -Prompt "Appuyer sur entrée pour continuer "
            menu_action_comptes_utilisateurs
        }


        6 {  
            Clear-host
            Write-Output "Ajout utilisateur a un groupe local"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $add_user_to_grp = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être ajouté à un groupe local ? " ;
	    $grp = Read-Host -Prompt "Nom du groupe  auquel l'utilisateur doit être ajouté ? " ;
	    Add-LocalGroupMember -Group $grp -Member $add_user_to_grp }
	    Write-Output "Le compte utilisateur local $add_user_to_admin à été ajouté au groupe $add_user_to_grp"   
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - Ajout de l'utilisateur $add_user_to_local_users au groupe local"
            Read-Host -Prompt "Appuyer sur entrée pour continuer "
            menu_action_comptes_utilisateurs
        }



        7 {  
            Clear-host
            Write-Output "Sortie utilisateur d'un groupe local"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $del_user_to_grp = Read-Host -Prompt "Nom de l'utilisateur dont le compte doit être enlevé d'un groupe local ? " ;
	    $del_grp = Read-Host -Prompt "Nom du groupe local duquel l'utilisateur doit être enlevé ? " ;
	    Remove-LocalGroupMember -Group $del_grp -Member $del_user_to_grp }
	    Write-Output "Le compte utilisateur local $del_user_to_grp à été enlevé au groupe $del_user_to_grp"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - sortie de l'utilisateur $del_user_to_local_users au groupe local"
            Read-Host -Prompt "Appuyer sur entrée pour continuer "
            menu_action_comptes_utilisateurs
        }

        r {  
            Write-Output ""
	    Write-Output "Retour au menu précédent"
	    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Précédent"
            menu_action
        }

        x {  
            Write-Output ""
	    Write-Output "Retour au menu principal"
	    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal
            }

        q {
	   Write-Output ""
           Write-Output "Vous quittez le script "
           Start-Sleep 3
           Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
           Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------"
           sortie_script }

        default {  
        echo "Erreur choix non valide merci de modifier votre choix"
        Start-Sleep 2
        }
    }
}



# Menu et fonctions pour : Action - Système


    function menu_action_systeme {
        
    Clear-Host

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

   # Actions effectuées en fonction du choix de l'utilisateur dans le menu ci-dessus
    switch ($reps) {

        1 {
            Clear-host
	    Write-Output "Création de repertoire"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $path_mkdir_name = Read-Host -Prompt "Chemin du repertoire à créer ? "; 
	    $script:mkdir_name = Read-Host -Prompt "Nom du repertoire à créer ?  " ;
     	    New-Item -Path "$path_mkdir_name\$mkdir_name" -ItemType Directory }
            write output "Repertoire $path_mkdir_name\$mkdir_name créé "
	    Read-host -Prompt "Appuyez sur entrée pour continuer"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - Création du repertoire "$mkdir_name" "
            menu_action_systeme
        }


        2 {
	    Clear-host
            Write-Output "Suppression de repertoire"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $path_del_dir_name = Read-Host -Prompt "Chemin du repertoire à supprimer ? " ;
     	    $del_dir_name = Read-Host -Prompt "Nom du repertoire à supprimer ? " ;
	    Remove-Item -Path "$path_del_dir_name\$del_dir_name" -Recurse -Force }
            write output "Repertoire $del_dir_name supprimé "
            Read-host -Prompt "Appuyez sur entrée pour continuer"
	    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - Suppression du répertoire $del_dir_name"
            menu_action_systeme

        }

        3 {
	    Clear-host
            Write-Output "Installation de logiciel"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $install_soft = Read-Host -Prompt "Nom du package à installer ? " ; Get-PackageProvider $install_soft}
            write output  "Package $install_soft installé "
            Read-host -Prompt "Appuyez sur entrée pour continuer"
	    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - Installation du package $install_soft"
            menu_action_systeme

        }

        4 {
	    Clear-host
            Write-Output "Desinstallation de logiciel"
            $desinstall_soft = Read-Host -Prompt "Nom du package à desinstaller ? " 
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - Installation du package $install_soft"
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock {  Uninstall-Package -Name $desinstall_soft}
            write output  "Package $desinstall_soft desinstallé "
            Read-host -Prompt "Appuyez sur entrée pour continuer"
            menu_action_systeme
        }


        5 {
            Clear-host
            Write-Output "Exécution de script sur une machine distante"
            $exec_script = Read-Host -Prompt "Nom du script a lancer ? "  
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - Execution du script $exec_script"
	    Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { $exec_script }
            Write output  "Package $exec_script lancé "
            Read-host -Prompt "Appuyez sur entrée pour continuer"
            menu_action_systeme           
        }

        6 {
            Write-Output "Verrouillage de la machine"
            Start-Sleep 2
            Invoke-commandInvoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { rundll32.exe user32.dll,LockWorkStation }
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A Verrouillé la Machine"           
            menu_action_systeme        
        }


        7 {
            Write-Output " Redémarrage machine"
            Start-Sleep 2 
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { shutdown /r }
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A Redémarré la Machine"
            Read-host -Prompt "Appuyez sur entrée pour continuer"
	    menu_action_systeme
        }


        8 {
            Write-Output " Arrêt machine"
            Start-Sleep 2
            Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { shutdown /s }
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A Arrêter la Machine"
            Read-host -Prompt "Appuyez sur entrée pour continuer"
	    menu_action_systeme
        }


        9 {
            Write-Output " Mise à jour de la machine"
            Invoke-Command -ComputerName CLIWIN01 -Credential $nom_utilisateur -ScriptBlock {  Import-Module PSWindowsUpdate Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot }
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A mis à jour la Machine"
            Read-host -Prompt "Appuyez sur entrée pour continuer" 
            menu_action_systeme
        }

        r {
            Write-Output "Retour au Menu Precedent"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Precedent"
            menu_action 
        }

        x {
            Write-Output "Retour au Menu Principal"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal 
        }

        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------"
            sortie_script 
        }

			
        default {
            Write-Output "Mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_action_systeme 
        }

    }
}


# Menu Information Pare-Feu 

function menu_information_pare_feu {

    Clear-Host
    Write-Output "Menu Information Pare-Feu"
    write-output "-------------------------"
    Write-Output "1) Statut du Pare-Feu"
    Write-Output "2) Liste des Ports Ouverts"
    Write-Output "3) Liste des Règles activés sur le Pare-feu"
    Write-Output "4) Liste des Règles bloqués sur le Pare-feu"
    Write-Output "r) Retour au Menu Precedent"
    Write-Output "x) Retour au Menu Principal"
    Write-Output "q) Sortie Script"
    $choix_securite = Read-Host -Prompt "faites votre choix " 
    switch ($choix_securite) {

        1 {
            Write-Output "Statut du Parefeu : "
	    $Statut_Pare_feu = Invoke-Command -ComputerName $adresse_ip -Credential $nom_utilisateur -ScriptBlock { Get-NetFirewallProfile | ft Name,Enabled }
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$statut_Pare_feu"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a affiché le status du Pare-feu"
            Read-Host -Prompt "Appuyez sur entrée pour continuer"
	    menu_information_pare_feu 
        }
			
        2 {
            Write-Output "Liste des ports ouvert : "
	    $Port_ouvert = Invoke-Command -ComputerName $adresse_ip -Credential $nom_utilisateur -ScriptBlock { netstat -ano | findstr LISTENING }
            $Port_ouvert
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$Port_ouvert"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a effectué l'action Affichage liste ports ouvert"
            Read-Host -Prompt "Appuyez sur entrée pour continuer"
	    menu_information_pare_feu 
        }
	      #Liste les règles activés sur le parefeu
        3 { 
            $Regle_Active = Invoke-Command -ComputerName $adresse_ip -Credential $nom_utilisateur -ScriptBlock { Get-NetFirewallRule | where {($_.enabled -eq $True) -and ($_.Direction -eq "Inbound")} | ft }
	    $Regle_Active
     	    Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$Regle_Active"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les informations de la version du système d'exploitation"
        }
            #Liste les règles bloqués sur le parefeu
        4 {
            $Regle_Bloque = Invoke-Command -ComputerName $adresse_ip -Credential $nom_utilisateur -ScriptBlock { Get-NetFirewallRule -Action Block | ft }
            $Regle_Bloque
	    Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$Regle_Bloque"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A afficher les Régles Bloqués sur le Pare Feu"
	}

        r {
            Write-Output "Retour au Menu Precedent"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Precedent"
            menu_information 
        }

        x {
            Write-Output "Retour au Menu Principal"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal 
        }

        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------"
            sortie_script 
        }

			

        default {
            Write-Output "Mauvaise commande veuillez réessayer"
            Start-Sleep 2
            menu_information_pare_feu 
        }
    }
} 
# Menu journalisation Permet d'accéder au donnée du fichier log 

function menu_journalisation {

    Clear-Host
    Write-Output "Menu Journalisation"
    write-output "-------------------"
    Write-Output "1) Recherche des evenements dans le fichier log_evt.log par utilisateur"
    Write-Output "2) Recherche des evenements dans le fichier log_evt.log pour un Ordinateur"
    Write-Output "r) Retour au Menu Precedent"
    Write-Output "x) Retour au Menu Principal"
    Write-Output "q) Sortie Script"
    $choix_journalisation = Read-Host -Prompt "Faites votre choix "

    switch ($choix_journalisation) {

        1 {
            Clear-Host
            $utilisateur = Read-Host -Prompt "Entrer le nom d'utilisateur : " 
            Get-Content C:\Windows\System32\LogFiles\log_evt.log.txt | findstr $utilisateur
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "Get-Content C:\Windows\System32\LogFiles\log_evt.log.txt | findstr $utilisateur"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - à Rechercher des événements effectuer par $utilisateur"
            Read-Host "Appuyer sur entrée pour continuer " 
            menu_journalisation 
        }

        2 {
            Clear-Host
            $ordinateur = Read-Host -Prompt "Entrer le nom de l'Ordinateur : " 
            Get-Content C:\Windows\System32\LogFiles\log_evt.log.txt | findstr $ordinateur
	    Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "Get-Content C:\Windows\System32\LogFiles\log_evt.log.txt | findstr $ordinateur"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - à effectuer l'action Affichage des événement de l'Ordinateur"
            Read-Host -Prompt "Appuyer sur entree pour continuer " 
            menu_journalisation 
        }
    
        r {
            Write-Output "Retour au Menu Precedent"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_information 
        }

        x {
            Write-Output "Retour au Menu Principal"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal 
        }
    
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------"
            sortie_script 
        }
    
        default {
            Write-Output "Mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_journalisation 
        }
    }
}
# Menu Information Réseaux 

function menu_information_reseaux {

    Clear-Host
    Write-Output "Menu Information Réseaux"
    Write-Output "------------------------"
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
            $MacAdresse = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-NetAdapter | fl Name, MacAddress }
            $MacAdresse
	    Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$MacAdresse"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - à effectuer l'action Affichage de l'adresse mac"
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_reseaux 
        }

        2 {
	    $InterfaceReseaux = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { Get-NetAdapter | fl Name }
            $InterfaceReseaux
	    Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$InterfaceReseaux"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - à effectuer l'action Affichage du nombre d'interface réseaux"
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_reseaux 
        }

        3 {   
            $AdresseIp = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { ((ipconfig | findstr [0-9].\.)[0]).Split()[-1] }
	    $AdresseIp
     	    Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$AdresseIp"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - à effectuer l'action Affichage adresse IP"
            Read-Host -Prompt "appuyer sur entrée pour continuer "
            menu_information_reseaux 
        }

        4 {
            $Port_ouvert = Invoke-Command -computername $adresse_ip -credential $nom_utilisateur -ScriptBlock { netstat -ano | findstr LISTENING }
            $Port_ouvert
	    Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "$Port_ouvert"
            Add-Content -Path C:\Users\Administrator\Documents\$nom_fichier_texte.txt -Value "--------------"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - à effectuer l'action Affichage liste ports ouvert"
	    Read-Host -Prompt "appuyer sur entrée pour continuer " 
            menu_information_reseaux 
        }

        r {
            Write-Output "retour au Menu Precedent"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Précédent"
            menu_information 
        } 
        

        x { 
            Write-Output "Retour au Menu Principal"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal 
        } 

        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------"
            sortie_script 
        } 

			
        default {
            Write-Output "Mauvaise commande veuillez réessayer"
            Start-Sleep 2
            menu_information_reseaux 
        }
    }
}
		 
#Crée un nouvelle règle sur le parfeu
function creer_regle_parefeu {

	Invoke-Command -ComputerName $adresse_ip -Credential wilder -ScriptBlock {                             
		
  		$nom_regle = $(Read-Host "Quel sera le nom de votre nouvelle règle de Pare-feu ?")
		$activer_bloquer = $(Read-Host "Votre nouvelle règle A) Active ou B) Bloque un traffic/port/programme ?")
		switch ($activer_bloquer) {
			A { $script:action = 'Allow' }
               		B { $script:action = 'Block' }
        		default { Write-Output "Mauvaise commande veuillez réessayer"
                	Start-Sleep 2
                	creer_regle_parefeu 
			}
        	}
		$entrant_sortant = $(Read-Host "Appliquer la règle sur le traffic E) Entrant ou S) Sortant ?")
		switch ($entrant_sortant) {
        		E { $script:direction = 'Inbound' }
			S { $script:direction = 'Outbound' }
        		default { Write-Output "Mauvaise commande veuillez réessayer"
			Start-Sleep 2
			creer_regle_parefeu 
			}
 		}
		$protocol = $(Read-Host "Quel protocole voulez-vous utiliser ?")
        	$port = $(Read-Host "Sur quel(s) port(s) voulez-vous appliquer votre nouvelle rêgle ?")
       		New-NetFirewallRule -DisplayName $nom_regle -Profile @('Domain', 'Private') -Direction $direction -Action $action -Protocol $protocol -LocalPort @($port)
	}
 	Write-Output "La nouvelle règle sur le pare-feu a été appliquée avec succès "
  	Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A crée un nouvelle règle sur le pare-feu"
  	Read-Host -Prompt "Appuyer sur entrée pour continuer"
   	menu_regle_parefeu
   	
}
#Supprimer une règle existante sur le parefeu
function supprimer_regle_parefeu {
	Invoke-Command -ComputerName $adresse_ip -Credential wilder -ScriptBlock { 
     		
		$nom_regle = $(Read-Host "Quel règle de Pare-feu voulez-vous supprimer ?")
                Remove-NetFirewallRule -DisplayName $nom_regle 
	}
 	Write-Output "La règle parefeu $nom_regle a bien été supprimée "
 	Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - A supprimé une règle sur le pare-feu"
  	Read-Host -Prompt "Appuyer sur entrée pour continuer"
   	menu_regle_parefeu
 }
#Menu pour établir une nouvelle regle sur le parefeu
function menu_regle_parefeu {
	
	Write-Output "A) Ajouter une nouvelle règle au Parer-Feu"
	Write-Output "S) Supprimer une règle de Pare-Feu existante"
	Write-Output "r) Revenir au menu precedent (Action sur les Pare-Feux)"
	Write-Output "x) Revenir au menu Principal"
	Write-Output "q) Sortie Script"
 	$choix_utilisateur = $(Read-Host "Quel est votre choix ?")
				
    	switch ($choix_utilisateur) {
		A { 
  
  		creer_regle_parefeu 
    
     		}
       
		S { 
  
  		supprimer_regle_parefeu 
  		
    		}		

		r {
            	Write-Output "Retour au menu Action sur les Pare-Feux"
            	Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Précédent"
            	menu_gestion_parefeu 
        	}
			
      	  	x {
           	Write-Output "Retour au menu Principal"
            	Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            	menu_principal
        	}
		
        	q {
            	Write-Output "Vous quittez le script "
            	Start-Sleep 3
            	Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
           	Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------"
            	sortie_script 
        	}
			
       		default {
            	Write-Output "Mauvaise commande veuillez réessayer"
            	Start-Sleep 2
            	menu_regle_parefeu
        }
    }  
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
            Invoke-Command -ComputerName $adresse_ip -Credential wilder -ScriptBlock { Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True }
            Write-Output "Le pare-feu est activé"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a Activé le pare-feu"
            Read-Host -Prompt "Appuyez sur entrée pour continuer"
            menu_gestion_parefeu 
          }
        2 {
            Invoke-Command -ComputerName $adresse_ip -Credential wilder -ScriptBlock { Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False }
            Write-Output "Le pare-feu est desactive"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a désactivé le pare-feu"
	    Read-Host -Prompt "Appuyez sur entrée pour continuer"
            menu_gestion_parefeu 
          }
        3 {
            Write-Output "Définition d'une nouvelle regle de pare-feu"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a choisi de définir une nouvelle regle de pare-feu"
            Read-Host -Prompt "Appuyez sur entrée pour continuer"
            menu_regle_parefeu 
        }
        r { 
            Write-Output "Retour au menu Action"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Précédent"
            menu_action 
        }
			
        x { 
            Write-Output "Retour au Menu Principal"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal 
        }
			
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient ---------------"
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
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a Sélectionné le Menu Information Compte / Utilisateur"
            Start-Sleep 2
            Clear-Host
            menu_information_utilisateur 
        }

        2 {
            Write-Output "Ouverture Menu Information Reseaux"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a Sélectionné le Menu Information Réseaux"
            Start-Sleep 2
            Clear-Host
            menu_information_reseaux 
        }

        3 {
            Write-Output "Ouverture Menu Information Systeme"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a Sélectionné le Menu Information Système"
            Start-Sleep 2
            Clear-Host
            menu_information_systeme 
        }

        4 {
            Write-Output "Ouverture Menu securite"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a Sélectionné le Menu Information Sécurité"
            Start-Sleep 2
            Clear-Host
            menu_information_pare_feu 
        }

        5 {
            Write-Output "Ouverture Menu Journalisation"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a choisi de Consulter le journal des événements"
            Start-Sleep 2
            Clear-Host
            menu_journalisation 
        }

        x {
            Write-Output "Retour au Menu Principal"
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est Retourné au Menu Principal"
            menu_principal 
        }
			
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********" 
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient ---------------" 
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
    Write-Output "-----------"
    1) Menu Comptes et Utilisateurs
    2) Menu Action Système
    3) Menu Gestion du Pare-Feu 
    x) Retour au menu Principal
    q) Sortie Script"
    $choix = Read-Host "Quel action souhaitez-vous realiser ? " 
	
    switch ($choix) {
        
        1 {
            Clear-Host
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a sélectionné le Menu Compte et Utilisateur" 
            menu_action_comptes_utilisateurs 
        }
        
        2 {
            Clear-Host
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a sélectionné le Menu Action sur le Système" 
            menu_action_systeme 
        }

        3 {
            Clear-Host
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a sélectionne le Menu Gestion Du Pare-Feu" 
            menu_gestion_parefeu 
        }

        x {
            Write-Output "Retour au menu principal "
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - est retourné au Menu Principal" 
            menu_principal 
        }
			
        q {
            Write-Output "Vous quittez le script "
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********" 
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient ---------------" 
            sortie_script 
        }

        default {	
            Write-Output "Mauvaise commande veuillez reessayer"
            Start-Sleep 2
            menu_action
        }          
    }		
}


# Fonction pour la connexion à distance en mode graphique (Bureau a distance / RDP)
function menu_connex_distance {

    Clear-host
    Write-Output "Lancement du bureau à distance, veuillez renseigner les informations nécessaires dans la fenêtre graphique"
    Start-Process "mstsc.exe" /v:"$adresse_ip"
    Read-host -Prompt "Appuyez sur entrée pour continuer et revenir au menu principal"
    menu_principal

}


# Fonction du Menu principal. Envoi l'utilisateur vers les sous-menus/fonctions Information et action
function menu_principal {
    Clear-Host
    Write-Output "			__________________________________________________"
    Write-Output "			|:						                        :|"
    Write-Output "			|:						                        :|"
    Write-Output "			|:	    	  MENU PRINCIPAL 		            :|"
    Write-Output "			|:						                        :|"
    Write-Output "			|:______________________________________________:|
	
	1) Effectuer des actions (exemple : creer un dossier, activer un par-feu...)
	2) Rechercher des informations (exemple : liste des utilisateurs, utilisation de la RAM....)
 	3) Connexion a un hote
	x) Quitter le script"
	

    Write-Output ""
    $choix = Read-Host -Prompt "	Que souhaitez-vous realiser ? 	" 
	
    switch ($choix) {

        1 {
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a Sélectionné le Menu Effectuer des actions"
            menu_action 
        }

        2 {
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a Sélectionné le Menu Rechercher des Informations"
            menu_information 
        }

        3 {
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - a Sélectionné Prise de main à distance"
            menu_connex_distance 
        }

        x {
            Write-Output "Vous quittez le script"
            Start-Sleep 3
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient - ********EndScript********" 
            Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient --------------" 
            sortie_script 
        }
    
        default {
            Write-Output "Mauvaise commande veuillez reessayer"
            Start-Sleep 3
            menu_principal
        }
    }
}

# Connexion Identification à la machine cliente
$adresse_ip = Read-Host -Prompt "A quelle machine voulez-vous vous connecter ( Nom de la machine / adresse IP ) ?  " 
$nom_utilisateur = Read-Host -Prompt "Veuillez renseigner le nom d'utilisateur pour la connexion à distance ?  "

$Date_log = Get-Date -Format "yyyy/MM/dd HH:mm:ss"
$Date = Get-Date -Format "yyyy_MM_dd"
Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient ---------------" 
Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log.txt -Value "$Date_log - $nom_utilisateur - $machineclient -********StartScript********"

$machineclient = Invoke-Command -ComputerName $adresse_ip -Credential wilder -ScriptBlock { $env:computername }
# Nom du fichier qui contiendra les informations collectées sur la machine cliente
nom_fichier_texte = info-$nom_utilisateur-$Date
# Le script commence ici
$nom_fichier_texte = "info-$nom_utilisateur-$Date"

menu_principal

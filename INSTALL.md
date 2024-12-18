# Documentation Administrateur

## Pour une utilisation du script avec BASH

### Prérequis techniques

- Une machine virtuelle __Debian Server 12__ connecté en réseau local
  - Un server SSH installé sur le server Debian 12
- Une machnie virtuelle __Ubuntu 24.0__ qui aura le rôle de client, et connecté sur le même réseau local que sur le server Debian 12.
  - Le port SSH (22) du client Ubuntu doit être ouvert (et le rester)    

### Étapes d'installation et de configuration :

#### Lancer le serveur SSH

Après avoir saisi vos identifiants de connexion au server Debian, pour prendre en compte la configuration de votre server SSH, il peut être nécessaire de redémarer votre interface réseau :
- Eteindre votre interface réseau
  - `sudo ifdown <nom_interface>`
- Démarer votre interface réseau
  - `sudo ifup <nom_interface>`
- Redémarer le server SSH
  - `sudo systemctl restart ssh`

#### Installation et Configuration
- Pour copier le script depuis une machine distante sur votre serveur, utilisez la commande :
  - `scp <nom_ustilisateur>@<ip_machine_utilisateur>:/répertoire/du_fichier.sh .`
- Avant tout execution du script, assurez vous que le fichier `log_evt.log` soit présent à l'emplacement `/var/log/` de l'ordinateur sur lequel vous allez l'exécuter.
- S'il n'existe pas, creez le fichier :
  - `log_evt.log` à l'emplacement `/var/log/`

#### Lancement du script

- Le script se trouve dans le dossier `/home/Documents` du server Debian
- Executer le script à l'aide de votre interpréteur de comande BASH en rentrant la commande :\
  - `bash post_scriptum.sh`

- Au lancement du script, celui-ci vous demande de renseigner l'adresse IP de l'ordinateur client sur lequel vous voulez effectuer des actions.
- Indiquez également le nom d'utilisateur avec lequel vous voulez vous connecter sur l'ordinateur client.
- Laissez-vous ensuite guider par la navigation des menus ou repportez vous à la [documentation utilisateur](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Documentation_Utilisateur.md "Documentation Utilisateur post_scriptum") pour un usage de base ou avancé du script.

### FAQ : Points de blocages / Modifications à venir

- Demande de mot de passe à chaque utilisation d'une tâche à travers le menu => problème d'ergonomie du script
  La modification à venir sera d'essayer d'implementer le protocole SSH avec une clé SSH, ce qui devrait solutionner ce problème
  
### FAQ : solutions aux problèmes connus et communs liés à l’installation et à la configuration


_________________________________________________

## Pour une utilisation du script avec WINDOWS

### Prérequis techniques

- Une machine virtuelle __Windows 10 ou 11 pro__ connecté en réseau local (le client)
  - Un server SSH installé sur le server Debian 12
- Une machnie virtuelle __Windows server 2022__ qui aura le rôle de serveur qui contiendra le script, et connecté sur le même réseau local que sur le client Windows.     

### Étapes d'installation et de configuration :


#### Configuration du service WinRM afin de pouvoir lancer des commandes Powershell en remote

  La configuration est à faire sur le client ET le serveur dans une fenetre Powershell en administrateur

  1) le service WinRM doit normalement être lancé mais vous pouvez le vérifié avec la commande : Get-Service WinRM
     Le status doit être sur "Running", sinon tapez la commande : `Enable-PSRemoting`

  2) Configurez les droits d'administration à distance par les utilisateurs locaux du serveur en paramêtrant le registre __LocalAccountTokenFilterPolicy__ sur 1
     
     ```PowerShell
     Set-ItemProperty –Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System –Name  LocalAccountTokenFilterPolicy –Value 1 –Type DWord
     ```
     
  4) Configuration du service WinRM
     
  ```winrm quickconfig```

  cette commande permet de réaliser une configuration rapide de WinRM, dans le but de démarrer le service et de faire en sorte qu'il démarre
  automatiquement. Cela va également permettre de créer une exception dans le pare-feu de Windows.
  Accepter par défaut les propositions de configuration en tapant "Y" à chaques questions
     
  
  3) Utilisation de WinRM depuis un PC hors domaine

   Si vous êtes dans une architecture Windows avec controleur de domaine avec Active Directory, il n'y a rien d'autre à faire. Par contre, si vous
  
  effectuez la connexion Winrm entre deux PC qui ne sont pas membre du même domaine Active Directory, il est nécessaire d'effectuer la configuration
  
  suivante.


  3.1) Mettre une machine en trusted host:

Set-Item WSMan:\localhost\Client\TrustedHosts -Value 'CLIWIN01'

Pour vérifier si la machine est dans trusted hosts :

Get-Item wsman:\localhost\Client\TrustedHosts

   
  3.2) Ajout du compte "wilder" dans le groupe "management users group"

Lors de l'utilisation de WinRM , afin d'éviter un refus de connexion du client, il est nécessaire d'avoir le compte local utilisé (ici wilder), dans le groupe "Remote management users"
Ceci devrait être suffisant pour l'utilisation de la commande "Invoke-Command" ou
Y



ATTENTTION sur le serveur, il semble que le groupe "management users group" n'existe pas de base 

Il faut le créer et mettre le compte "wilder" dans ce nouveau groupe"




#### Installation et Configuration du script



#### Lancement du script

- Le script se trouve dans le dossier `c:\users\Administrateur` du serveur Windows
- Executer le script depuis une fenetre Powershell avec les droits administrateur en rentrant la commande :
  - `c:\users\Administrateur\post_scriptum.ps1`

- Au lancement du script, celui-ci vous demande de renseigner l'adresse IP de l'ordinateur client sur lequel vous voulez effectuer des actions.
- Indiquez également le nom d'utilisateur avec lequel vous voulez vous connecter sur l'ordinateur client.
- Laissez-vous ensuite guider par la navigation des menus ou repportez vous à la [documentation utilisateur](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Documentation_Utilisateur.md "Documentation Utilisateur post_scriptum") pour un usage de base ou avancé du script.




### FAQ :

__Comment puis-je utiliser le script sur mon serveur debian connécté en réseau sans accès à internet ?__
- la commande __scp__ peut être utilisée pour récupérer un fichier, et donc le scrip sur un ordinateur connecté sur le même réseau que le serveur. Pour l'utiliser, vous pouvez vous référer à [l'installation et la configuration](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/INSTALL.md#installation-et-configuration) de la documentation.

__Les ordinateurs et serveur de mon réseau ne sont pas relié par un active directory. Puis-je quand même utiliser le script ?__
- Il est possible d'utiliser le script sans être dans un active directory, en configurant le service de windows __Winrm__ sur votre serveur et vos ordinateurs clients. Suivez les [Étapes d'installation et de configuration](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/INSTALL.md#%C3%A9tapes-dinstallation-et-de-configuration--1) de la documentation pour configurer vos postes.

__Par quel moyen le script bash se connecte et effectuer des tâches sur une machine distante du réseau ?__
- Le script Bash utilise le __protocole SSH__ pour réaliser des tâches sur poste client à distance. SSH doit être installé et configuré sur le serveur ainsi que sur les postes du réseau sur lesquel vous voulez effectuer des tâches. Une fois le protocole SSH installé, au démarrage de votre serveur, configuez le en suivant [le lancement du serveur SSH](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/INSTALL.md#lancer-le-serveur-ssh) de la documentation. Assurez-vous que le port 22 sur vos postes clients soient ouvert pour que le serveur puisse s'y connecter en SSH. 




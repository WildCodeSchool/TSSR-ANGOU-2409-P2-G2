# Documentation Administrateur

## Pour une utilisation du script avec BASH

### Prérequis techniques

- Une machine virtuelle __Debian Server 12__ connecté en réseau local
  - Un server SSH installé sur le server Debian 12
- Une machnie virtuelle __Ubuntu 24.0__ qui aura le rôle de client, et connecté sur le même réseau local que sur le server Debian 12.
  - Le port SSH (22) du client Ubuntu doit être ouvert (et le rester)    

### Étapes d'installation et de configuration :

#### Lancer le serveur SSH

Après avoir saisi vos identifiants de connexion au server Debian, pour prendre en compte la configuration de votre server SSH, il peut être necessaire de redémarer votre interface réseau :
- Eteindre votre interface réseau
  - `sudo ifdown <nom_interface>`
- Démarer votre interface réseau
  - `sudo ifup <nom_interface>`
- Redémarer le server SSH
  - `sudo systemctl restart ssh`

#### Installation et Configuration
- Avant tout execution du script, assurez vous que le fichier `log_evt.log` soit présent à l'emplacement `/var/log/` de l'ordinateur sur lequel vous allez l'exécuter.
- S'il n'existe pas, creez le fichier :
  - `log_evt.log` à l'emplacement `/var/log/`

#### Lancement du script

- Executer le script à l'aide de votre interpréteur de comande BASH en rentrant la commande :\
  - `bash post_scriptum.sh`

- Au lancement du script, celui-ci vous demande de renseigner l'adresse IP de l'ordinateur client sur lequel vous voulez effectuer des actions.
- Indiquez également le nom d'utilisateur avec lequel vous voulez vous connecter sur l'ordinateur client.
- Laissez-vous ensuite guider par la navigation des menus ou repportez vous à la [documentation utilisateur](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Documentation_Utilisateur.md "Documentation Utilisateur post_scriptum") pour un usage de base ou avancé du script.

### FAQ : Points de blocages / Modifications à venir

- Demande de mot de passe à chaque utilisation d'une tâche à travers le menu
- Prise en main à distance en GUI

### FAQ : solutions aux problèmes connus et communs liés à l’installation et à la configuration


_________________________________________________

## Pour une utilisation du script avec WINDOWS

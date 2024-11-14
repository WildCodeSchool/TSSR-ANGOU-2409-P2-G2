# Documentation Administrateur

_______________________________________________

## BASH
## Prérequis techniques

- Une machine virtuelle __Debian Server 12__ connecté en réseau local
  - Un server SSH installé sur le server Debian 12
- Une machnie virtuelle __Ubuntu 24.0__ qui aura le rôle de client, et connecté sur le même réseau local que sur le server Debian 12.
  - Le port SSH (22) du client Ubuntu doit être ouvert (et le rester)    

### Lancer le serveur SSH
Après avoir saisi vos identifiants de connexion au server Debian, pour prendre en compte la configuration de votre server SSH, il peut être necessaire de redémarer votre interface réseau.
`sudo ifdown <nom_interface>`
Démarer votre interface réseau
`sudo ifup <nom_interface>`
Redémarer le server SSH
`sudo systemctl restart ssh`

### Installation et Lancement du script
Une fois votre server redémaré

Rentrer les informations de connexion à la machine 


## Étapes d'installation et de conf. : instruction étape par étape


## FAQ : solutions aux problèmes connus et communs liés à l’installation et à la configuration

_________________________________________________

## WINDOWS

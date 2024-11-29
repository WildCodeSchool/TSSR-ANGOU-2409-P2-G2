# TSSR-ANGOU-2409-P2-G2 THE SCRIPTING PROJECT DOCUMENTATION GENERALE

## Index

1) [Présentation du projet et objectifs finaux](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/tree/main?tab=readme-ov-file#1-pr%C3%A9sentation-du-projet-objectifs-finaux)
2) [Mise en contexte](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/tree/main?tab=readme-ov-file#2-introduction--mise-en-contexte)
3) [Membres du groupe projet, rôles par sprint et objectifs par sprint](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/tree/main?tab=readme-ov-file#3-membres-du-groupe-de-projet-r%C3%B4les-par-sprint)
4) [Choix Techniques](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/tree/main?tab=readme-ov-file#4-choix-techniques--quel-os-quelle-version-etc)
5) [Difficultés rencontrés](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/tree/main?tab=readme-ov-file#5-difficult%C3%A9s-rencontr%C3%A9es--probl%C3%A8mes-techniques-rencontr%C3%A9s)
6) [Solutions aux problèmes rencontrés](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/tree/main?tab=readme-ov-file#6-solutions-trouv%C3%A9es--solutions-et-alternatives-trouv%C3%A9es)
7) [Améliorations futures](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/tree/main?tab=readme-ov-file#7-am%C3%A9liorations-possibles--suggestions-dam%C3%A9liorations-futures)



## 1) Présentation du projet, objectifs finaux

L'objectif de ce projet en équipe est de mettre en place une architecture réseau client/serveur et de créer des scripts Bash et PowerShell fonctionnels. Ces script doivent permettre de réaliser des actions systèmes et des requêtes d'informations depuis un serveur vers des postes clients sur un réseau local et éventuellement avec des machines ayant un système d'exploitation différent.
Toutes les manipulations dès le lancement des scripts seront incrcrites dans un fichier journal.
Ces scripts devront être présentés, et leur installation ainsi que leur fonctionnalités devront être documentés.



## 2) Introduction : mise en contexte

En 2022 un raport de Cisco évaluait le nombre d'équipements numériques connectés à 28.5 milliards et 4.8 millards d'utilisateurs connectés au réseaux Internet.
Avec l'augmentation des objets et des services connectés, les techniciens et services informatiques en charge de l'administration des équipements et réseaux sont donc de plus en plus solicités et ils n'ont plus le temps de jouer aux cartes :-). 
Afin de faciliter l'intégration et la désintégration des utilisateurs et leurs équipements, gagner en rapidité, en souplesse le technicien informatique peut, en s'appuyant sur une infrastructure réseau, faire l'usage de scripts, automatiser ses tâches et enfin finir sa partie de carte !!!


## 3) Membres du groupe de projet (rôles par sprint)

| Rôles du groupe | SPRINT 1 | SPRINT 2 | SPRINT 3 | SPRINT 4 | SPRINT 5 | 
|:--------| :------: | :-----------: | :-----------: | :--------: | :--------: |
| Scrum Master  | Mathieu  | Thomas | Frederic | Tristan | Mathieu | Tristan |
| Product Owner |  Thomas | Frederic |  Tristan | Mathieu | Thomas | Frederic |
| Technicien 1  |  Frederic |  Tristan | Thomas | Frederic | Tristan | Mathieu |
| Technicien 2 |  Tristan | Mathieu | Mathieu | Thomas | Frederic |   | Thomas |


Objectifs Semaine 1 : 

 - Réaliser le squelette du script
 - Ebauche de la documentation
 - Connecter en Réseaux les postes Serveur/Client Linux et Windows
 - Recherche des commandes

Objectifs Semaine 2 :

 - Scripting bash
 - Ajout des commentaires dans le script
 - Implementation du protocole SSH sur les postes Linux
 - Implementation journalisation

Objectifs Semaine 3 :

- Implementation du protocole SSH sur les postes Windows
- Finalisation documentation (partie bash)
- Scriping Powershell

Objectifs Semaine 4 :

- Tests / deboguage script bash
- Compléter la  documentation pour le Sprint
- Recherche et installation du protocol
- Choix de la méthode et des mesures de progression


## 4) Choix techniques : quel OS, quelle version, etc.

Pour le choix des serveurs, nous avons :

    Serveur 1
        DEBIAN 12
        -Nom : SRVLX01
        -Compte : root
        -Mot de passe : Azerty1*
        -Adresse IP : 172.16.10.10/24

    Serveur 2
        WINDOWS SERVER 2022
        -Nom : SRVWIN01
        -Compte : Administrator
        -Mot de passe : Azerty1*
        -Adresse IP : 172.16.10.5/24

Pour le choix des postes clients, nous avons :

    Poste 1
        UBUNTU 22.04 LTS
        -Nom : CLILIN01
        -Compte : wilder
        -Mot de passe : Azerty1*
        -Adresse IP : 172.16.10.30/24

    Poste 2
        WINDOWS 10 PRO
        -Nom : CLIWIN01
        -Compte wilder
        -Mot de passe : Azerty1*
        -Adresse IP : 172.16.10.20/24



## 5) Difficultés rencontrées : problèmes techniques rencontrés

1) Durant le projet ,des problèmes ont été rencontrés liés à la configuration réseau pouvant gêner la communication à distance entre les machines, notamment à cause du pare-feux, la configurations des services ( open ssh et winrm) pour pouvoir réaliser les actions et obtenir les informations sur des postes à distance.

2) Des difficultés pour faire évoluer les scripts en travaillant sur différentes parties séparément. Le travail en séquentiel (Chacun prenait le script à tour de rôle) à poser des problèmes de performance et de fiabilité.

3) Les tests pour valider les commandes Bash ont été faites en local sur une machine et lorsque ils ont été testé à la fin du travail sur le script bash, certaines commande ont posé problème.

4) Des difficultés sont apparu dans les scripts concernant la portée des variables

## 6) Solutions trouvées : Solutions et alternatives trouvées


1) Sous windows, avec le service WinRM, pour s'affranchir de certains problèmes de pare-feu, il a fallu modifier de paramètres réseaux dans Virtualbox. Sous Linux, avec le protocole SSH, il a fallu configurer le pare-feu pour laisser ouvert le port 22.

2) Pour améliorer la productivité lors de la construction et l'évolution des scripts, il à été testé l'utilisation de push et get avec Github. Des progrès sont encore à réaliser...

3) Pour éviter les problèmes de test des commandes pour le script bash, pour le script Powershell, les commandes ont été testés directement dans l'architecture réseaux et client/serveur Windows.

4) Concernant le problème de portée des variables, les investigations sont toujours en cours



## 7) Améliorations possibles : suggestions d’améliorations futures

- Utiliser le script autrement qu'en connexion SSH
- Affiner les règles à du Firewall (rejeter certains trafic, autoriser/refuser une plage d'adresse) pour une gestion du traffic plus souple et précise qu'avec le script actuelle (autorisation ou refus uniquement sur les ports ou protocoles)
- Améliorer la gestion des erreurs (utilisateur déjà existant, fichier ou dossier déjà présent ou inexistant...)
- Améliorer les scripts après avoir trouvé comment mieux gérer la portée des variables
- Inatallation d'un Active Directory pour avoir Les dernieres Date de connetion et de changement de mots de passe 

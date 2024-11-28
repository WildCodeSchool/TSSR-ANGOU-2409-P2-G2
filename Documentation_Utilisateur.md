# Documentation Utilisateur


# 1 ) SCRIPT BASH




## Utilisation de base : comment utiliser les fonctionnalités clés

Au lancement du script, le menu principal s'affiche :
puis vous avez plusieurs choix possibles soit réaliser des actions ou rechercher des informations sur la machine client.

### Navigation dans les menus

**Menu Principal**   

Vous permet de choisir entre les menus _Action_ ou _Informations_

![image](https://github.com/user-attachments/assets/e8f51c2b-44af-4fcf-991d-9aa6c1e61196)


________________________________________________________

**Actions :**

![image](https://github.com/user-attachments/assets/70359be3-1a70-4ae7-bd67-d25e65aca8f2)


Gestion des dossier, créer ou supprimer un dossier en indiquant son emplacment :         
Pouvoir gerer l'alimentaion de la machine à distance : `6 - verrouillage_machine` / `7 - Redemarrage de la machine`/ `8 - arret de la machine` / `9 -mise à jour du système de la machine`:   



**Informations :**   

Les différents droits et permsissions, connexions et date de modification de mot de passe.    
Liste des utilisateurs locaux

### Création d'un nouvel utilisateur

Pour créer un nouvel utilisateur, accédez au menu __Action comptes et utilisateurs__ :\
Depuis le __Menu Principal__ séléctionnez :\
__1) Effectuer des Actions__

![menu_principal_action](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_principal_action.png)

Puis depuis le menu action séléctionnez :
__1) Menu Comptes et Utilisateurs :__

![menu_action_comptes utilisateurs](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/menu_action_compte_users.png)

Dans le menu __Action comptes et utilisateurs__, sélectionnez __1) Création de compte utilisateur local__

![menu_action_utilisateur_newuser](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Action_comptes_users.png)

Saisissez le nom du nouvel uilisateur à créer :

![creer_utilisateur](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/nouvel_user.png)

Afin d'activer la session du nouvel utilisateur sur la machine distante il faut lui donner mot de passe.
Depuis le menu __Action comptes et utilisateurs__, sélectionnez __2) Changement de mot de passe utilisateur__ :

![changement_de_mot_de_passe](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/menu_action_password.png)

Saisissez le nom de l'utilisateur nouvellement crée

![saisir_utilisateur](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/utilisateur_modif_password.png)

Puis rentrer le nouveau mot de passe pour l'utilisateur. Vous serez invité à le saisir une seconde fois pour le confirmer

![saisir_mot_de_passe](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/saisie_password.png)

La session du nouvelle utilisateur est activée sur la machine distante

![session_utilisateur](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/session_utilisateur_cree.png)

## Utilisation avancée :

### Gestion du pare-feu : 

Depuis le menu principal, séléctionnez  __1) Effectuer des actions__

![menu_principal_action](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_principal_action.png)

Puis, depuis le menu des actions séléctionnez __3) Menu Gestion du Parefeu__

![menu_gestion_parefeu](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/menu_action_parefeu.png)

Dans le Menu Gestion du Parefeu, vous pouvez choisir d'activer ou désactiver le parefeu de la machine client ou déterminer de nouvelles règles de pare-feu.

#### Déterminer une nouvelle règle sur le Pare-feu
Le script permet uniquement d'accepter ou de refuser de nouvelles règles (ouverture/fermeture de ports et/ou autorisation/refus de protocole...)
Dans l'exemple suivant nous choisirons d'ouvrir le port 80 et autoriser le protocole http sur celui-ci. 
> note : La gestion des ports et des protocoles est indépendante l'une de l'autre. Si vous voulez uniquement établir une règle pour un port ou un protocole, laissez vide le champs sur lequel vous ne voulez pas établir de nouvelles règles en appuyant sur __entrée__.

Depuis le menu Gestion du Parefeu, séléctionnez __3) Définir une nouvelle règle de pare-feu__

![nouvelle_regle_parefeu](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/gestion_parefeu_regle.png)

Pour ouvrir le port 80 nous séléctionnons __A) Autoriser/Ouvrir un protocole ou un port__ (s'il s'agissait d'interdire le traffic sur celui-ci nous aurions pu séléctionner __I) Interdire/Fermer un protocole ou un port__)

![autoriser_port](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/autoriser_port.png)

Nous saisissons ensuite le numéro du port :

![numéro_port](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/num%C3%A9ro_port.png)

Puis le nom du protocole :

![nom_protocole](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/protocole.png)

Le script nous renvois __"Nouvelle règle de pare feu établie : `80 http allow` "__, nous confirmant ainsi que la nouvelle règle a bien été appliquée.

![confirmation](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/regle_etablie.png)


- Journalisation, rechercher des évenements avec les fichiers logs : 




# 2 ) SCRIPT POWERSHELL


## Utilisation de base : comment utiliser les fonctionnalités clés

Au lancement du script, il est d'abord demandé sur quel machine distante l'administrateur souhaite se connecter et avec quel compte.

![Paramètres de connexion distante ](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/connexion_machine_utilisateur2.png)

puis, le menu principal s'affiche. Vous avez alors plusieurs choix possibles soit réaliser des actions ou rechercher des informations sur la machine client, ou encore lancer le bureau à distance sur l'hôte avec les paramètres renseigner pour la connexion à distance



### Navigation dans les menus


________________________________________________________

**Menu Principal**   

Vous permet de choisir entre les menus _Action_ ou _Informations_ ou bien lancer un bureau à distance.

![Menu principal](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_principal2.png)




A partir du menu suivant, quel que soit le menu, il sera possible de revenir au menu principal, au menu précédent ou de sortir du script ( toujours avec le même choix, les lettres q / r / x ).

________________________________________________________

**Menu Action :**

Ce menu et ses sous-menu, permet, la gestion des dossier, créer ou supprimer un dossier en indiquant son emplacement.      
Il permet aussi la gestion de la machine à distance avec le verrouillage de la machine, le Redémarrage de la machine / l'arrêt de la machine  /  la mise à jour du système de la machine


![Menu action](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_action.png)



**Menu Action comptes et utilisateur :**


![Menu action](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_action_comptes_et_utilisateurs.png)


**Menu Action système :**

![Menu action](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_action_systeme.png)

________________________________________________________

**Menu Information :**  

Ce menu et ses sous-menu, permet d'afficher les différents droits et permissions, connexions et date de modification de mot de passe, lister des utilisateurs locaux ou encore consulter le journal des événements (log)
Il permet aussi d'afficher des information sur le système distant, comme l'espace disque disponible, la RAM de libre, etc...

![Menu_information](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_information.png)



**Menu Information utilisateurs :** 

![Menu_information_utilisateur](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_information_utilisateur.png)



**Menu Information système :** 



![Menu_information_systeme](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_information_systeme.png)


**Menu Information réseaux :**

![Menu_information_réseaux](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_information_reseaux.png)


**Menu Information pare-feu :**

![Menu_information_pare-feu](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/Menu_information_pare-feu.png)




**Menu consulter le journal des événements :**

![Menu_journalisation](https://github.com/WildCodeSchool/TSSR-ANGOU-2409-P2-G2/blob/main/Images/menujournalisation.png)


## FAQ : solutions aux problèmes connus et communs liés à l’utilisation des scripts 


## Y a t'il des prérequis avant de lancer ce script ? 
Oui et c'est très important, vous devez avoir des autorisations suffisantes pour exécuter des commandes à distance sur la machine cible.


 ## Quels sont les bonnes pratiques pour l'utilisation du script ? 
 
 vérifier les autorisations avant d'exécuter des commandes système, vérifier deux fois les informations saisies pour éviter les erreurs
 
 ##  Que faire si des erreurs apparaissent pendant l'exécution du script ? 
 
 vérifiez en premier lieu que les conditions prérequisent sont remplies, telles que l'activation de PowerShell Remoting pour le script Powershell par exemple (voir documentation administrateur)

 

 




 

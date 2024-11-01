# The Gossip Project

Bienvenue dans **The Gossip Project** ! Cette application Rails permet aux utilisateurs de partager des potins, de les commenter et de les "liker", comme sur Facebook. Les utilisateurs peuvent également voir les potins par ville et interagir avec ceux des autres.

## Table des matières
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Fonctionnalités](#fonctionnalités)
- [Technologies utilisées](#technologies-utilisées)
- [Contributions](#contributions)
- [Licence](#licence)

## Installation

### Prérequis
- Ruby (version 3.2.2 recommandée)
- Rails (version 7.2.1.2 recommandée)
- PostgreSQL pour la base de données

### Étapes d'installation

1. Clonez le repository :
   ```bash
   git clone https://github.com/votre_nom_d_utilisateur/the_gossip_project.git

2. **Installez les dépendances Ruby :**
  ```bash
  bundle install
  ```

3. **Configurez la base de données :**

- Création de la base de données :

  ```bash
    rails db:create
    rails db:migrate
  ```
4. Initialisation de la base de données avec des données de test :
```bash
  rails db:seed
```
### Lancer l'application

1. Démarrez le serveur Rails :
```bash
rails server
```

2. Accédez à l'application dans votre navigateur : Ouvrez http://localhost:3000 pour voir l'application en action.

### Utilisation

  - Inscrivez-vous pour créer un compte.
  - Connectez-vous pour créer des potins et les associer à une ville.
  - Consultez les potins des autres utilisateurs, commentez-les et likez-les.
  - Accédez aux potins par ville pour voir ceux qui sont proches de chez vous.

### Fonctionnalités

  - CRUD des utilisateurs : Inscription, connexion, édition et suppression.
  - CRUD des potins : Création, édition, affichage et suppression de potins.
  - Commentaires : Ajout de commentaires aux potins.
  - Likes : Possibilité de liker et déliker des potins.
  - Affichage par ville : Voir tous les potins associés à une ville.
  - Sécurité : Mot de passe crypté avec BCrypt pour les utilisateurs.

###  Technologies utilisées

  - Ruby on Rails : Framework principal pour la construction de l'application.
  - PostgreSQL : Base de données relationnelle pour stocker les informations.
  - BCrypt : Utilisé pour le cryptage des mots de passe.
  - Bootstrap : Framework CSS pour styliser l'interface utilisateur.
  - Faker : Gemme pour générer des données de test et de développement.
  - Stimulus/Turbo : Utilisés pour l'interactivité sans rechargement complet de page.
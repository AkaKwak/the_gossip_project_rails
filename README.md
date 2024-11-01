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
  ```  
- Migration de la base de données :
  ```bash
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


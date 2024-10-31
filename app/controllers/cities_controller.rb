class CitiesController < ApplicationController
    def index
      @city = City.all
    end

    def show
      @city = City.find(params[:id]) # Trouve la ville par son ID
      @gossips = @city.users.flat_map(&:gossips) # Récupère tous les potins des utilisateurs de la ville
    end
    
  
    def new
      @city = City.new
      # Méthode qui crée un user vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    end
    def create
      # Méthode qui créé un user à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
      # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le user créé)
    end
  
    def edit
      # Méthode qui récupère le user concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end
  
    def update
      # Méthode qui met à jour le user à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le user modifié)
    end
  
    def destroy
      # Méthode qui récupère le user concerné et le détruit en base
      # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end
end

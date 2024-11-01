class SessionsController < ApplicationController
  def new
    # Affiche le formulaire de connexion
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Connexion réussie !"
      redirect_to root_path
    else
      flash.now[:alert] = "Email ou mot de passe incorrect."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Déconnexion réussie."
    redirect_to root_path
  end
end

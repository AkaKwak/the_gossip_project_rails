class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    anonymous_user = User.find_by(first_name: "Anonymous", last_name: "User")
    @gossip = Gossip.new(gossip_params)
    @gossip.user = anonymous_user

    if @gossip.save
      flash[:notice] = "The super popotin a été créer !"
      redirect_to gossips_path
    else
      flash.now[:alert] = "Erreur : Pas de popotins crée!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gossip = Gossip.find(params[:id]) # Trouve le potin à éditer
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: "Potin mis à jour avec succès !"
    else
      render :edit
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
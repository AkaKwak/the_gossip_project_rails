class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

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
    @gossip = current_user.gossips.build(gossip_params)
    if @gossip.save
      flash[:notice] = "Potin créé avec succès."
      redirect_to @gossip
    else
      render :new
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

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:notice] = "Potin supprimé avec succès !"
    redirect_to gossips_path
  end

  private

def correct_user
  @gossip = current_user.gossips.find_by(id: params[:id])
  redirect_to root_path, alert: "Accès non autorisé" if @gossip.nil?
end

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end

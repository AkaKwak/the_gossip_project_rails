class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def new
    @comment = Comment.new
  end

  def create
  @comment = Comment.new(comment_params)
  @comment.user = current_user
  @comment.gossip = Gossip.find(params[:gossip_id])

    if @comment.save
      flash[:notice] = "Commentaire ajouté avec succès."
      redirect_to gossip_path(@comment.gossip)
    else
      flash.now[:alert] = "Erreur lors de l'ajout du commentaire."
      redirect_to gossip_path(@comment.gossip), status: :unprocessable_entity
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:notice] = "Commentaire mis à jour avec succès !"
      redirect_to gossip_path(@gossip)
    else
      flash[:alert] = "Erreur lors de la mise à jour du commentaire."
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Commentaire supprimé avec succès."
    redirect_to gossip_path(@gossip)
  end

  private

  def correct_user
    @comment = Comment.find(params[:id])
    unless @comment.user == current_user
      flash[:alert] = "Accès non autorisé !"
      redirect_to gossip_path(@comment.gossip)
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

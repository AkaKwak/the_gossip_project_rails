class CommentsController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    anonymous_user = User.find_or_create_by(first_name: "Anonymous", last_name: "User")
    @comment = @gossip.comments.build(comment_params)
    @comment.user = anonymous_user

    if @comment.save
      flash[:notice] = "Commentaire ajouté avec succès !"
    else
      flash[:alert] = "Erreur lors de l'ajout du commentaire."
    end
    redirect_to gossip_path(@gossip)
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

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

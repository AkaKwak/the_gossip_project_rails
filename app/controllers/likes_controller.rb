class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @like = @gossip.likes.build(user: current_user)

    if @like.save
      flash[:notice] = "Vous avez liké ce potin."
    else
      flash[:alert] = "Impossible de liker ce potin."
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @like = @gossip.likes.find_by(user: current_user)

    if @like
      @like.destroy
      flash[:notice] = "Vous avez retiré votre like."
    else
      flash[:alert] = "Impossible de retirer le like."
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def authenticate_user
    redirect_to new_session_path, alert: "Vous devez être connecté pour liker." unless current_user
  end
end

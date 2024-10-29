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
      flash[:notice] = "The super poptin a été créer !"
      redirect_to gossips_path
    else
      flash.now[:alert] = "Error: #{ @gossip.errors.full_messages.join(", ") }"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def update
  
  end
end



#Je suis le nouveau commit
class UsersController < ApplicationController

  def show
    @users = User.find(params[:id])
    render template: "users/profile"
  end
end

class StaticPagesController < ApplicationController
  def team
    
  end

  def welcome
    @name = params[:name].capitalize
  end

end

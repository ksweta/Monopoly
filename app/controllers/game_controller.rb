class GameController < ApplicationController
	before_filter :authenticate_user!
	
  def index
  	@games = Game.all
  end

  def show
  end

  def list
  end

  def create
  	@game = Game.create!(turn: 0, status: :initialized)
  	if @game.save
  		redirect_to "show"
  	else
  		redirect_to "welcome/index"
  	end
  end

  def destroy
  	#p @game.class
  	@games.destroy
  	redirect_to "index"
    #respond_to do |format|
    # format.html { redirect_to games_url }
    #end
  end
end

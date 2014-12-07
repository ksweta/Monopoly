class GameController < ApplicationController
	before_filter :authenticate_user!
	
  def index
  	@games = Game.all
  	@users = User.all
  end

  def show
  	@game = Game.find(params[:id])
  end

  def list
  end

  def create
  	@game = Game.create!(turn: 0, status: :initialized)
  	p @game.players.create!(user: current_user, position: 0, balance: 200.00)
  	redirect_to welcome_path #welcome_path
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

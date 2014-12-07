	class GameController < ApplicationController
		before_filter :authenticate_user!
		
		def index
			@games = Game.all
			@users = User.all
		end

		def show
			@game = Game.find(params[:id])
		end

		def join
			@game = Game.find(params[:id])
			player_exists = false

			if @game.players.size < 4
				@game.players.each do |player|
					if player.user_id == current_user.id
						player_exists = true
					end
				end
			end

			if !player_exists
				@game.players.create!(user: current_user, position: 0, balance: 1999.00, email: current_user.email)
			end
			redirect_to :action => "show", id: params[:id] 
		end

	def list
	end

	def create
		@game = Game.create!(turn: 0, status: :initialized)
		p @game.players.create!(user: current_user, position: 0, balance: 2000.00, email: current_user.email)
	  	redirect_to :action => "show", id: @game.id #welcome_path
	end
end

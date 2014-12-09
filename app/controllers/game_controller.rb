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

			p "Size of players: " + @game.players.length.to_s
			if @game.players.length < 4
				@game.players.each do |player|
					p "User ID: " + player.user_id.to_s
					p "Joining ID: " + current_user.id.to_s
					if player.user_id == current_user.id
						player_exists = true
					end
				end
			end

			unless player_exists
				@game.players.create!(user: current_user, position: 0, balance: 2000.00, email: current_user.email)
				Pusher.trigger('game-'+params[:id].to_s, 'new-player', {:player => @game.players.length})
			end
			p "Channel: game-"+params[:id].to_s
			redirect_to :action => "show", id: params[:id] 
		end

	def create
		@game = Game.create!(turn: 0, status: :initialized)
		p @game.players.create!(user: current_user, position: 0, balance: 2000.00, email: current_user.email)
	  	redirect_to :action => "show", id: @game.id #welcome_path
	end


	#Game Chat Update
	def chat_message
		Pusher.trigger('game-'+params[:id].to_s+'-chat', 'new-message', {:message => params[:message], :uid => current_user.email})
	end
end

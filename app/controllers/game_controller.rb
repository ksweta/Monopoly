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

			if @game.players.length < 4
				@game.players.each do |player|
					if player.user_id == current_user.id
						player_exists = true
					end
				end
			end

			if !player_exists && @game.players.length < 4
				@game.players.create!(user: current_user, position: 0, balance: 2000.00, email: current_user.email)
				Pusher.trigger('game-'+params[:id].to_s, 'new-player', {:player => @game.players.length})
			end
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

	def start_button
		p "game status: " + @game.status
		@game = Game.find(params[:id])
		@game.status = :inprogress
		p "game status after: " + @game.status
	end
end

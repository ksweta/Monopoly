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
		@game.players.create!(user: current_user, position: 0, balance: 2000.00, email: current_user.email)
	  	redirect_to :action => "show", id: @game.id #welcome_path
	end


	#Game Chat Update
	def chat_message
		Pusher.trigger('game-'+params[:id].to_s+'-chat', 'new-message', {:message => params[:message], :uid => current_user.email})
	end

	def start_button
		p "IN START GAME"
		@game = Game.find(params[:id])
		@game.update(status: :inprogress)
		p @game.status
		Pusher.trigger('game-'+params[:id].to_s+'-chat', 'game-started', 
			{:message => "The host has started the game. Goodluck and have fun!", 
				:player_turn => @game.players[@game.turn].email})
	end

	def roll_dice
		@game = Game.find(params[:id])
		roll = 2 + rand(11)
		turn = @game.turn
		if turn+1 < @game.players.length 
			@game.update(turn: turn+1)
		else 
			@game.update(turn: 0)
		end
		Pusher.trigger('game-'+params[:id].to_s, 'dice-roll', {:player => turn + 1, :roll => roll, :turn => @game.turn+1, :email => @game.players[turn].email})
	end

end

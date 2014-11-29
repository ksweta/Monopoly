require 'pusher'

Pusher.app_id = '98459'
Pusher.key = '4eff344ae11ed3c814c8'
Pusher.secret = '109bd47c82d5b4745aab'

class WelcomeController < ApplicationController
	before_filter :authenticate_user!

	def index
		Pusher.trigger('public-chat', 'new-message', {:message => 'hello world'})
	end

end

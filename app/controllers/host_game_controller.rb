class HostGameController < ApplicationController
	before_filter :authenticate_user!
	
  def host
  end
end

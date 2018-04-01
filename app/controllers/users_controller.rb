class UsersController < ApplicationController
  before_action :authenticate, except: :profile
		#Built-in devise methods
		# user_signed_in?
		# current_user
		# user_session
	def profile
		@user = User.find_by_username(params[:username])
		@parkS = ParkingSpot.where(user_id: @user.id)
		@rentals = Rent.where(buyer_id: @user.id)
	end


end

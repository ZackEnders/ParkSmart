class ReservationsController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@reservation = Reservation.new
	end
	
	def create
		@reservation = Reservation.new(reservation_params)
			if @reservation.save
				flash[:notice] = "Reservation successful"
				redirect_to "/parkingspots/#{@reservation.parkingspot_id}/reservations/#{@reservation.id}"
			end	
	end
	
	def show 
		
		@reservation = Reservation.find(params[:id])
		@parkingspot = Parkingspot.find(params[:parkingspot_id])

		@user = User.find(@parkingspot.user_id)
	end

	private
		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :price, :total, :parkingspot_id, :user_id)
		end
end

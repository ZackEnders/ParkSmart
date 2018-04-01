class RentsController < ApplicationController
	def index
		@rentals = Rent.all
	end

	def show

	end

	def new
		@rental = Rent.new
		@parkS = ParkingSpot.find_by_id(params[:id])

	end

	def create
		@rental = Rent.new(rental_params)
      if @rental.save
        flash[:notice] = "Purchase Successful!"
        redirect_to root_path
      else
        flash[:notice] = "Purchase Unsuccessful!"
        render root_path
      end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	private 

    def rental_params
      params.require(:rent).permit(:buyer_id, :rate, :seller_id, :start_time, :end_time, :parking_spot_id, :location)
    end
end

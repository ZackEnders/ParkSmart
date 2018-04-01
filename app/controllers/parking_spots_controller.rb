class ParkingSpotsController < ApplicationController
  def index
    @parkS = ParkingSpot.all
  end

  def new
    @parkS = ParkingSpot.new
  end

  def create
    parkS = ParkingSpot.new(parkS_params)
      if parkS.save
        flash[:notice] = "Parking Spot created!"
        redirect_to root_path
      else
        flash[:notice] = "Parking Spot was NOT created!"
        render root_path
      end
  end

  def show
    @parkS = ParkingSpot.find(params[:id])
    @rental = Rent.new
  end

  def edit
    @parkS = ParkingSpot.find(params[:id])

      if current_user.id == @parkS.user_id

      else
        flash[:notice] = "Access Denied"
        redirect_to root_path
      end
  end

  def update
    @parkS = ParkingSpot.find(params[:id])

      if @parkS.update(parkS_params)
        flash[:notice] = ""
        redirect_to root_path
      else
        flash[:notice] = ""
        render rooth_path
      end

  end

  def destroy
    parkS = ParkingSpot.find(params[:id])

    if parkS.destroy
      flash[:notice] = "Parking Spot deleted!"
      redirect_to root_path
    else
      flash[:notice] = "Could not delete Parking Spot!"
      render root_path
    end

  end

  private 

    def parkS_params
      params.require(:parking_spot).permit(:user_id, :rate, :location, :image, :start_time, :end_time, :rented, :spotsAvail, :description)
    end


end

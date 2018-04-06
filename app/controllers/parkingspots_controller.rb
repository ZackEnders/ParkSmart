class ParkingspotsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
	before_action :authenticate_user!, except: [:show, :index]

	def index
    @parkingspots = Parkingspot.all
  end

  def new
    @parkingspot = Parkingspot.new
  end

  def show
    @reservation = Reservation.new
    @reservations = Reservation.where(parkingspot_id: @parkingspot.id)
    @unavailableDates = []
    #Stores the reservation dates in an array
      @reservations.each do |t|
        @unavailableDates.push({start_date: t.start_date.strftime('%Y-%m-%d'), end_date: t.end_date.strftime('%Y-%m-%d')})
      end
      #Converts the reservation dates to json and then parses the data which allows for sorting
        @data = @unavailableDates.to_json
        @object = JSON.parse(@data, object_class: OpenStruct)
    @reservedDates = []
    #Pushes the date results into an array 
      @object.each do |o|
        @reservedDates.push(o.start_date)
        @reservedDates.push(o.end_date)
      end
  end

  def create

    @parkingspot = Parkingspot.new(parkingspot_params)
    if @parkingspot.save
    	flash[:notice] = "Parking Spot Created!"
      redirect_to "/profile/#{current_user.username}"
    else
      render :new
    end
  end

    def edit

        if current_user.id == @parkingspot.user_id

          else 
            flash[:notice] = "Access Denied"
            redirect_to root_path

        end
  end

    def update
      

      #if the parking spot is updated it stores the parkingspot_params and alerts the user that it was updated
        if @parkingspot.update(parkingspot_params)
            flash[:notice] = "Parking spot post updated!"
            redirect_to "/profile/#{current_user.username}"
        else
            flash[:notice] = "Parking spot update unsuccessful!"
            render edit_parkingspot_path
        end
  end

  def destroy

      parkingspot = Parkingspot.find(params[:id])
      #if parking spot destroy is successful then it alerts the user that it was deleted
        if parkingspot.destroy
            flash[:notice] = "Parking spot post deleted!"
            redirect_to "/profile/#{current_user.username}" 
        else
            flash[:notice] = "Could not delete parking spot!"
            render edit_parkingspot_path
      end
  end


  private
  def set_room
    @parkingspot = Parkingspot.find(params[:id])
  end

  def parkingspot_params
    params.require(:parkingspot).permit(
       	:user_id, :address, :price, :rented, 
       	:description, :latitude, :longitude, :listing_name,
        :image, :image_data, :remove_image)
  end
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date,
       :price, :total, :parkingspot_id)
  end

end

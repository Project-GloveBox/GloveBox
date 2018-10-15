class VehiclesController < ApplicationController
  
  
  require "prawn"
    
  
  def index
    @vehicles = current_user.vehicles
    # redirect_to new_vehicle_path
  end


  def show
    @vehicle = Vehicle.find(params[:id])
  end
 

  def new
    @vehicle = Vehicle.new
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    # unless current_user.id == @vehicle.user_id
    #   redirect_to vehicles_path 
    # end
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = current_user.id
  
  
    
    if @vehicle.save
      
      redirect_to vehicles_path
    else
      render 'new'
    end
    
  end  
  
  def update
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.update(vehicle_params)
        redirect_to vehicles_path
    else
        render 'edit'
    end
  end

  def destroy 
    @vehicle = Vehicle.find(params[:id])
      @vehicle.destroy
      redirect_to vehicles_path
  end
 
  

  private

    def vehicle_params
       params.require(:vehicle).permit(:name, :year, :make, :model, :insurance, :vin, :license_plate,
                                       :tire_psi, :registration, :title, :inspection_date, :color, :user_id, 
                                       :authenticity_token)
    end

    # def set_vehicle
    #   @vehicles = current_user.vehicles
    # end

end

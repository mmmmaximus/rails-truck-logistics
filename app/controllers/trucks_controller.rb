class TrucksController < ApplicationController
  load_and_authorize_resource

  helper_method :trucks, :truck

  def index
    model_attributes(Truck)
    @model_attributes.push('driver_name', 'route_name', 'cargo_name', 'model_type_name')
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)

    if @truck.save
      redirect_to trucks_path
    else
      render 'new'
    end
  end

  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])

    if @truck.update(truck_params)
      redirect_to trucks_path
    else
      render 'edit'
    end
  end

  def destroy
    truck = Truck.find(params[:id])
    truck.destroy

    redirect_to trucks_path
  end

  private
  def truck_params
    params.require(:truck).permit(:license_plate, :capacity, :color, :service_date, :status, :model_type_id)
  end

  def trucks
    @trucks ||= Truck.all
  end

  def truck
    @truck
  end
end

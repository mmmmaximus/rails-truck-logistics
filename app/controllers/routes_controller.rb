class RoutesController < ApplicationController
  load_and_authorize_resource

  helper_method :routes, :route

  def index
    model_attributes(Route)
    @model_attributes.push('truck_name')
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to routes_path, notice: "#{route.name} successfully created"
    else
      render 'new'
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])

    if @route.update(route_params)
      redirect_to routes_path, notice: "#{route.name} successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    route = Route.find(params[:id])
    route.destroy

    redirect_to routes_path, notice: "#{route.name} successfully deleted"
  end

  private
  def route_params
    params.require(:route).permit(:name, :length_of_time, :truck_id)
  end

  def routes
    @routes ||= Route.all
  end

  def route
    @route
  end
end

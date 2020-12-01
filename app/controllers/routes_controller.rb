class RoutesController < ApplicationController
  helper_method :routes, :route

  def index
    @model_attributes = model_attributes(Route)
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to routes_path
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
      redirect_to routes_path
    else
      render 'edit'
    end
  end

  def destroy
    route = Route.find(params[:id])
    route.destroy

    redirect_to routes_path
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

class RoutesController < ApplicationController
  helper_method :routes

  def index
    @model_attributes = model_attributes(Route)
  end

  private

  def routes
    @routes ||= Route.all
  end
end

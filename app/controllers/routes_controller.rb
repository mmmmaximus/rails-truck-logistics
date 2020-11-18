class RoutesController < ApplicationController
  helper_method :routes

  def index
  end

  private

  def routes
    @routes ||= Route.all
  end
end

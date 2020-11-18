class RoutesController < ApplicationController
  helper_method :routes
  private
  def routes
    @routes ||= Routes.all
  end
end

class TrucksController < ApplicationController
  helper_method :trucks
  private
  def trucks
    @trucks ||= Truck.all
  end
end

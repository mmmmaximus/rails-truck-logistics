class TrucksController < ApplicationController
  helper_method :trucks

  def index
  end

  private

  def trucks
    @trucks ||= Truck.all
  end
end

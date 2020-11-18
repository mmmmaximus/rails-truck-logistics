class TrucksController < ApplicationController
  helper_method :trucks

  def index
    @model_attributes = model_attributes(Truck)
  end

  private

  def trucks
    @trucks ||= Truck.all
  end
end

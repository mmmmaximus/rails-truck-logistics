class DriversController < ApplicationController
  helper_method :drivers

  def index
    @model_attributes = model_attributes(Driver)
  end

  private

  def drivers
    @drivers ||= Driver.all
  end
end

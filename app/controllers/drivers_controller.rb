class DriversController < ApplicationController
  helper_method :drivers

  def index
  end

  private

  def drivers
    @drivers ||= Driver.all
  end
end

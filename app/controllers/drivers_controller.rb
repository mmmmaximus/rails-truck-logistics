class DriversController < ApplicationController
  helper_method :drivers
  private
  def drivers
    @drivers ||= Driver.all
  end
end

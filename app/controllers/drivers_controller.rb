class DriversController < ApplicationController
  helper_method :drivers

  def index
    @model_attributes = model_attributes(Driver)
  end

  def destroy
    driver = Driver.find(params[:id])
    driver.destroy

    redirect_to drivers_path
  end

  private
  def drivers
    @drivers ||= Driver.all
  end
end

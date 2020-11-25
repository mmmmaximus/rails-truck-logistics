class DriversController < ApplicationController
  helper_method :drivers
  helper_method :driver

  def index
    @model_attributes = model_attributes(Driver)
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if driver.save
      redirect_to drivers_path
    else
      render 'new'
    end
  end

  def destroy
    driver = Driver.find(params[:id])
    driver.destroy

    redirect_to drivers_path
  end

  private
  def driver_params
    params.require(:driver).permit(:name, :license_number, :mobile_number, :email_address, :age, :notes, :status)
  end

  def drivers
    @drivers ||= Driver.all
  end

  def driver
    @driver
  end
end

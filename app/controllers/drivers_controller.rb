class DriversController < ApplicationController
  load_and_authorize_resource

  helper_method :drivers, :driver

  def index
    model_attributes(Driver)
    @model_attributes.push('truck_name')
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path, notice: "#{driver.name} successfully created"
    else
      render 'new'
    end
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])

    if @driver.update(driver_params)
      redirect_to drivers_path, notice: "#{driver.name} successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    driver = Driver.find(params[:id])
    driver.destroy

    redirect_to drivers_path, notice: "#{driver.name} successfully deleted"
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

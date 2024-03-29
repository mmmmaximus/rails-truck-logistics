class CargosController < ApplicationController
  load_and_authorize_resource

  helper_method :cargos, :cargo

  def index
    model_attributes(Cargo)
    @model_attributes.push('truck_name')
  end

  def new
    @cargo = Cargo.new
  end

  def create
    @cargo = Cargo.new(cargo_params)

    if @cargo.save
      redirect_to cargos_path, notice: "#{cargo.title} successfully created"
    else
      render 'new'
    end
  end

  def edit
    @cargo = Cargo.find(params[:id])
  end

  def update
    @cargo = Cargo.find(params[:id])
    if @cargo.update(cargo_params)
      redirect_to cargos_path, notice: "#{cargo.title} successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    cargo = Cargo.find(params[:id])
    cargo.destroy

    redirect_to cargos_path, notice: "#{cargo.title} successfully deleted"
  end

  private
  def cargo_params
    params.require(:cargo).permit(:description, :title, :reference_number, :value, :paid, :truck_id)
  end

  def cargos
    @cargos ||= Cargo.all
  end

  def cargo
    @cargo
  end
end

class ModelTypesController < ApplicationController
  load_and_authorize_resource

  helper_method :model_types, :model_type

  def index
    model_attributes(ModelType)
    @model_attributes.push('truck_name')
  end

  def new
    @model_type = ModelType.new
  end

  def create
    @model_type = ModelType.new(model_type_params)

    if @model_type.save
      redirect_to model_types_path
    else
      render 'new'
    end
  end

  def edit
    @model_type = ModelType.find(params[:id])
  end

  def update
    @model_type = ModelType.find(params[:id])

    if @model_type.update(model_type_params)
      redirect_to model_types_path
    else
      render 'edit'
    end
  end

  def destroy
    model_type = ModelType.find(params[:id])
    model_type.destroy

    redirect_to model_types_path
  end

  private
  def model_type_params
    params.require(:model_type).permit(:name, :brand)
  end

  def model_types
    @model_types ||= ModelType.all
  end

  def model_type
    @model_type
  end
end

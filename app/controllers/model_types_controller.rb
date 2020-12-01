class ModelTypesController < ApplicationController
  helper_method :model_types

  def index
    model_attributes(ModelType)
  end

  private

  def model_types
    @model_types ||= ModelType.all
  end
end

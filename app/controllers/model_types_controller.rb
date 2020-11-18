class ModelTypesController < ApplicationController
  helper_method :model_types

  def index
  end

  private

  def model_types
    @model_types ||= ModelType.all
  end
end

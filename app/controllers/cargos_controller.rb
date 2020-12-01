class CargosController < ApplicationController
  helper_method :cargos

  def index
    model_attributes(Cargo)
  end

  private

  def cargos
    @cargos ||= Cargo.all
  end
end

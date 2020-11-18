class CargosController < ApplicationController
  helper_method :cargos

  def index
  end

  private

  def cargos
    @cargos ||= Cargo.all
  end
end

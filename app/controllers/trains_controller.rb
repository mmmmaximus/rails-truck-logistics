class TrainsController < ApplicationController
  def index
    @trains = Api.new.index
  end

  def create
  end

  def edit
  end

  def destroy
  end

end

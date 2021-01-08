class TrainsController < ApplicationController
  def index
    @trains = TrainAPI.new.index
  end

  def create
  end

  def edit
  end

  def destroy
  end

end

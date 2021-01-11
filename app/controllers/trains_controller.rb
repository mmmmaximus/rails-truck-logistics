class TrainsController < ApplicationController
  def index
    @trains = TrainApi.new.index
  end

  def create
  end

  def edit
  end

  def destroy
  end

end

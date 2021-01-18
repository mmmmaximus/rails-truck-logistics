class TrainsController < ApplicationController
  def index
    @trains = TrainApi.new.index
  end

  def edit
    flash["errors"] = nil
    @train = TrainApi.new.show(params)
  end

  def create
  end

  def update
    response = TrainApi.new.update(params[:id], params)

    if response.success?
      redirect_to trains_path
    else
      flash["errors"] = response["errors"]
      @train = params[:train]
      render "edit"
    end
  end

  def destroy
    response = TrainApi.new.destroy(params[:id])
    redirect_to trains_path
  end
end

class TrainsController < ApplicationController
  helper_method :train

  def index
    @trains = TrainApi.new.index
  end

  def edit
    flash["errors"] = nil
    @train = TrainApi.new.show(params[:id])
  end

  def create
  end

  def update
    train_params = params.require(:train).permit(:name, :train_model_name, :number_of_cars, :max_weight_capacity, :active)
    response = TrainApi.new.update(params[:id], train_params)

    if response.success?
      redirect_to trains_path
    else
      flash["errors"] = response["errors"]
      @train = params[:train]
      render "edit"
    end
  end

  def destroy
  end

  private
  def train
    @train
  end
end

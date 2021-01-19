class TrainsController < ApplicationController
  helper_method :train

  before_action :train_params, only: [:create, :update]

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
    response = TrainApi.new.update(params[:id], train_params)

    if response.success?
      redirect_to trains_path, notice: response["message"]
    else
      flash["errors"] = response["errors"]
      @train = params[:train]
      render "edit"
    end
  end

  def destroy
    response = TrainApi.new.destroy(params[:id])
    redirect_to trains_path, notice: response["message"]
  end
<<<<<<< HEAD
=======

  private
  def train_params
    params.require(:train).permit(:name, :train_model_name, :number_of_cars, :max_weight_capacity, :active)
  end

  def train
    @train
  end
>>>>>>> main
end

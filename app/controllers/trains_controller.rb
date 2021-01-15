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
    @train = TrainApi.new.update(params[:id], params)
    debugger

    if @train.response.message == "OK"
      redirect_to trains_path
    else
      flash["errors"] = @train["errors"]
      @train = params[:train]
      render "edit"
    end
  end

  def destroy
  end

end

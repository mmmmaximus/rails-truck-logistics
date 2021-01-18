class TrainApi
  include HTTParty

  def initialize
    self.class.base_uri ENV['TRAIN_API_URL']
  end

  def index
    response = self.class.get('/v1/trains')
    JSON.parse(response.body)
  end

  def show(id)
    response = self.class.get("/v1/trains/#{id}")
    JSON.parse(response.body)
  end

  def update(id, params)
    train_params = params.require(:train).permit(:name, :train_model_name, :number_of_cars, :max_weight_capacity, :active)
    self.class.patch("/v1/trains/#{id}", body: {train: train_params})
  end
end

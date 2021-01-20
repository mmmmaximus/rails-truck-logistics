class TrainApi
  include HTTParty

  def initialize
    self.class.base_uri ENV['TRAIN_API_URL']
  end

  def index
    response = self.class.get('/v1/trains')
    JSON.parse(response.body)
  end

  def new
    response = self.class.get('/v1/trains/new')
    JSON.parse(response.body)
  end

  def show(id)
    response = self.class.get("/v1/trains/#{id}")
    JSON.parse(response.body)
  end

  def create(params)
    self.class.post("/v1/trains", body: {train: params})
  end

  def update(id, params)
    self.class.patch("/v1/trains/#{id}", body: {train: params})
  end

  def destroy(id)
    self.class.delete("/v1/trains/#{id}")
  end
end

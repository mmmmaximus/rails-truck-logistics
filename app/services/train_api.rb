class TrainApi
  include HTTParty

  def initialize
    self.class.base_uri ENV['TRAIN_API_URL']
  end

  def index
    response = self.class.get('/v1/trains')
    JSON.parse(response.body)
  end
end

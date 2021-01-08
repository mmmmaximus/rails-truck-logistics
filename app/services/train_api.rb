class TrainAPI
  include HTTParty

  def initialize
    self.class.base_uri 'localhost:3001'
  end

  def index
    response = self.class.get('/v1/trains')
    JSON.parse(response.body)
  end
end

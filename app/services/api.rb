class Api
  include HTTParty

  def initialize
    self.class.base_uri 'localhost:3001'

  end

  def unique_url
    response = HTTParty.get('/v1/trains')
    JSON.parse(response.body)
  end
end
